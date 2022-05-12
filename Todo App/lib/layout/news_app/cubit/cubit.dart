import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/news_app/cubit/states.dart';
import 'package:flutter_application_1/shared/network/remote.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewStates>{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];

  // List<Widget> screens = [
  //   Business(),
  //   Sports(),
  //   Science(),
  // ];

  void changeBottomNavIndex(int index){
    currentIndex = index;
    if(index == 1)
      getSports();
    if(index == 2)
      getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness(){
    emit(NewsGetLoadingBusinessState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country' : 'eg',
          'category' : 'business',
          'apiKey' : '4c059338f92d48268c739821f22b40ea',
        }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports(){
    emit(NewsGetLoadingSportsState());

    if(sports.length == 0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country' : 'eg',
            'category' : 'sports',
            'apiKey' : '4c059338f92d48268c739821f22b40ea',
          }).then((value) {
        //print(value.data['articles'][0]);
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewGetSportsErrorState(error.toString()));
      });
    }
    else{
      NewGetSportsSuccessState();
    }

  }

  List<dynamic> science = [];

  void getScience(){
    emit(NewsGetLoadingScienceState());

    if(science.length == 0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country' : 'eg',
            'category' : 'science',
            'apiKey' : '4c059338f92d48268c739821f22b40ea',
          }).then((value) {
        //print(value.data['articles'][0]);
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewGetScienceErrorState(error.toString()));
      });
    }
    else{
      emit(NewGetScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value){
    emit(NewsGetLoadingSearchState());

    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q' : '$value',
          'apiKey' : '4c059338f92d48268c739821f22b40ea',
        }).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewGetSearchErrorState(error.toString()));
    });
  }

}
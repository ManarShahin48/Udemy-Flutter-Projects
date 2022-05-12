import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user/shop_app/login_model.dart';
import 'package:flutter_application_1/modules/shop_app/settings/login/cubit/states.dart';
import 'package:flutter_application_1/shared/network/end_points.dart';
import 'package:flutter_application_1/shared/network/remote.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  ShopAppLogin shopLoginModel;
  void userLogin({
    @required String email,
    @required String password,
  }) {
    emit(ShopLoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      shopLoginModel = ShopAppLogin.fromJson(value.data);
      emit(ShopLoginSuccessState(shopLoginModel));
    }).catchError((error) {
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ShopChangePasswordVisibilityState());
  }

}

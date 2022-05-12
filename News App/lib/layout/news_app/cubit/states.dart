abstract class NewStates {}

class NewsInitialState extends NewStates{}

class NewsBottomNavState extends NewStates{}

class NewsGetLoadingBusinessState extends NewStates{}

class NewGetBusinessSuccessState extends NewStates{}

class NewGetBusinessErrorState extends NewStates{
  final String error;
  NewGetBusinessErrorState(this.error);
}

class NewsGetLoadingSportsState extends NewStates{}

class NewGetSportsSuccessState extends NewStates{}

class NewGetSportsErrorState extends NewStates{
  final String error;
  NewGetSportsErrorState(this.error);
}

class NewsGetLoadingScienceState extends NewStates{}

class NewGetScienceSuccessState extends NewStates{}

class NewGetScienceErrorState extends NewStates{
  final String error;
  NewGetScienceErrorState(this.error);
}

class NewsGetLoadingSearchState extends NewStates{}

class NewGetSearchSuccessState extends NewStates{}

class NewGetSearchErrorState extends NewStates{
  final String error;
  NewGetSearchErrorState(this.error);
}
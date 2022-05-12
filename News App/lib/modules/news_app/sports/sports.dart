import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/news_app/cubit/cubit.dart';
import 'package:flutter_application_1/layout/news_app/cubit/states.dart';
import 'package:flutter_application_1/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sports extends StatelessWidget {
  //const Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewStates>(
      listener: (context, state){},
      builder: (context, state){
        var list = NewsCubit.get(context).sports;

        return articleBuilder(list, context);
      },
    );
  }
}
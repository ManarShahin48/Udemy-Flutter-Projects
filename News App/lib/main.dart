import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/bloc_observer.dart';
import 'package:flutter_application_1/shared/cubit/cubit.dart';
import 'package:flutter_application_1/shared/cubit/states.dart';
import 'package:flutter_application_1/shared/network/local/chashed_helper.dart';
import 'package:flutter_application_1/shared/network/remote.dart';
import 'package:flutter_application_1/shared/styles/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () {
      AppCubit();
    },
    blocObserver: MyBlocObserver(),
  );

  DioHelper.init();
  await CashHelper.init();

  bool isDark = CashHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsCubit()
              ..getBusiness()
              ..getSports()
              ..getScience()),
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: lightTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}

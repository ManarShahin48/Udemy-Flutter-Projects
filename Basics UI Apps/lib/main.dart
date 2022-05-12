import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/basics_app/counter/counter_screen.dart';
import 'package:flutter_application_1/modules/basics_app/login/login_screen.dart';
import 'package:flutter_application_1/modules/basics_app/messanger/messanger_screen.dart';
import 'package:flutter_application_1/shared/bloc_observer.dart';
import 'package:flutter_application_1/shared/network/local/chashed_helper.dart';
import 'package:flutter_application_1/shared/network/remote.dart';
import 'package:flutter_application_1/shared/styles/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginScreen(),
      // home: CounterScreen(),
      home: MessangerScreen(),
    );
  }
}

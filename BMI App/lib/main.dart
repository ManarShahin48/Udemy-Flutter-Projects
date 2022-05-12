import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/bmi_app/bmi/bmi_cal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isDark = false;

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: BmiScreen(),
          );      
  }
}

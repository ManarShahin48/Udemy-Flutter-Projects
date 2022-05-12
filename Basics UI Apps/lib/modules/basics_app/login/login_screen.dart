import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  onChanged: (value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                      //hintText: 'Email Address',
                      labelText: 'Email Address',
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: passController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  onChanged: (value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                      //hintText: 'Email Address',
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultButton(
                    width: double.infinity,
                    backgroud: Colors.blue,
                    function: () {
                      print(emailController.text);
                      print(passController.text);
                    },
                    text: 'login'),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Register Now',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

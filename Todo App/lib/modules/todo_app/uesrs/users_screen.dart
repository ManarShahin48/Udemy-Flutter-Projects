import 'package:flutter/material.dart';

class UserModel {
  final int id;
  final String name;
  final String phone;

  UserModel({
    @required this.id,
    @required this.name,
    @required this.phone,
  });
}

class UserScreen extends StatelessWidget {
  
  List<UserModel> users = [
    UserModel(
      id: 1,
      name: 'Mannnnnnar Shahin',
      phone: '+201069573236',
    ),
    UserModel(
      id: 1,
      name: 'Mannnnnnar Shahin',
      phone: '+201069573236',
    ),
    UserModel(
      id: 1,
      name: 'Mannnnnnar Shahin',
      phone: '+201069573236',
    ),
    UserModel(
      id: 1,
      name: 'Mannnnnnar Shahin',
      phone: '+201069573236',
    ),
    UserModel(
      id: 1,
      name: 'Mannnnnnar Shahin',
      phone: '+201069573236',
    ),
    UserModel(
      id: 1,
      name: 'Mannnnnnar Shahin',
      phone: '+201069573236',
    ),
    UserModel(
      id: 2,
      name: 'Mannnnnnar Shahin',
      phone: '+201069573236',
    ),
    UserModel(
      id: 1,
      name: 'Mannnnnnar Shahin',
      phone: '+201069573236',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: users.length,
      ),
    );
  }

  Widget buildUserItem(UserModel user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${user.id}',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${user.phone}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
    ),
  );
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mohsin/user_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserModel userObject =
      UserModel(id: "001", fullName: "mannan", email: "mir@gmail.com");

  String userJSON =
      '{"id":"0001","fullName":"Mir mannan","email":"mirm@gmail.com"}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> userMap = userObject.toMap();
                  var json = jsonEncode(userMap);
                  print(json);
                },
                child: Text(
                  "Serialize",
                ),
              ),
              SizedBox(
                width: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  var decoded = jsonDecode(userJSON);
                  Map<String, dynamic> userMap = decoded;
                  UserModel newUser = UserModel.fromMap(userMap);
                  print(newUser.fullName);
                },
                child: Text(
                  "De Serialize",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mohsin/services/note_service.dart';
import 'package:mohsin/student_model.dart';

class Student extends StatefulWidget {
  const Student({Key? key}) : super(key: key);

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  ApiServices _apiServices = ApiServices();

  String json = '{"name":"mohsin","grade":"8th","rollNo":"1"}';

  StudentModel studentObj =
      StudentModel(name: "fahad", grade: "8th", rollNo: "2");

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
                // print(studentObj);
                // Map<String, dynamic> studentMap = studentObj.toMap();
                // print(studentMap.runtimeType);
                // var jsonEncoded = jsonEncode(studentMap);
                // print(jsonEncoded.runtimeType);
                final notes = _apiServices.getNotes();
                print(notes);
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
                var decode = jsonDecode(json);
                StudentModel student = StudentModel.fromMap(decode);
                print(student.name);
              },
              child: Text(
                "De Serialize",
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

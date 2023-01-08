import 'package:flutter/material.dart';

Container getComponent(
    {required String name,
    String? grade,
    required String profession,
    required String company}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.indigo,
    ),
    child: Column(
      children: [
        Text("Hi! my Name is $name"),
        Text("I m in  ${grade ?? "error in"} class"),
        Text("i am a $profession"),
        Text("i work at  $company "),
      ],
    ),
  );
}

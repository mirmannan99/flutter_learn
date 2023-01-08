import 'package:flutter/material.dart';

class WidgetModel {
  String? name;
  Color? color;
  VoidCallback? callback;
  WidgetModel({this.name, this.color, this.callback});
}

WidgetModel item1 = WidgetModel(
  color: Colors.red,
  name: "One",
);

WidgetModel item2 =
    WidgetModel(color: Colors.blue, name: "One", callback: () {});

WidgetModel item3 =
    WidgetModel(color: Colors.green, name: "One", callback: () {});

WidgetModel item4 =
    WidgetModel(color: Colors.yellow, name: "One", callback: () {});

// Map<String,String> flutter = {
//   "name":"mannan",
//   "id":"1234",
// };

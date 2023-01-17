import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mohsin/controller/api_controller.dart';

import '../model/note_list.dart';

class ApiServices {
  static const baseUrl = "https://tq-notes-api-jkrgrdggbq-el.a.run.app";
  final header = {"apiKey": "a571f9b6-33f7-4cf7-a80f-8f08563d8a48"};

  Future<ApiResponse<List<Note>>> getNotes() {
    Uri uri = Uri.parse(baseUrl + "/notes");

    return http.get(uri, headers: header).then((response) {
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        final noteList = <Note>[];
        for (var item in jsonData) {
          noteList.add(Note.fromJson(item));
        }
        return ApiResponse<List<Note>>(
          data: noteList,
        );
      }
      return ApiResponse<List<Note>>(
          error: true, errorMessage: "An error message");
    }).catchError((_) => {
          ApiResponse<List<Note>>(error: true, errorMessage: "An error message")
        });
  }
}

// data //error // ui reprsent

//header
//body

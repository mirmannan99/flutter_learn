import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:mohsin/controller/api_controller.dart';

import '../model/note_list.dart';
import '../model/single_note.dart';

class ApiServices {
  static const baseUrl = "https://tq-notes-api-jkrgrdggbq-el.a.run.app";
  final header = {
    "apiKey": "a571f9b6-33f7-4cf7-a80f-8f08563d8a48",
    "Content-Type": "application/json"
  };

  var logger = Logger();

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

//! fetching single note API

  Future<ApiResponse<SingleNote>> getNote({required String noteId}) async {
    try {
      Uri uri = Uri.parse(baseUrl + "/notes/${noteId}");

      final response = await http.get(uri, headers: header);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return ApiResponse<SingleNote>(
          data: SingleNote.fromJson(jsonData),
        );
      }
      return ApiResponse<SingleNote>(
          error: true, errorMessage: "Error in Fetching API");
    } catch (e) {
      return ApiResponse<SingleNote>(
          error: true, errorMessage: "Exception Catched");
    }
  }
}

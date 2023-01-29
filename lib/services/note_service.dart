import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:mohsin/controller/api_controller.dart';
import 'package:mohsin/model/add_note.dart';

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

  //! post: adding the note

  Future<ApiResponse<bool>> addNote(AddNoteModel addNote) async {
    try {
      Uri uri = Uri.parse(baseUrl + "/notes");

      Map<String, dynamic> note = addNote.toJson();
      // logger.e(note);
      final json = jsonEncode(note);
      // logger.wtf(json);

      final response = await http.post(uri, headers: header, body: json);
      final respStat = response.statusCode;
      switch (respStat) {
        case 201:
          return ApiResponse<bool>(data: true);

        default:
          return ApiResponse<bool>(
              error: true, errorMessage: "Not Created", data: false);
      }
    } catch (e) {
      return ApiResponse<bool>(
          error: true, errorMessage: "Whole Error", data: false);
    }
  }

//! updating the notes

  Future<ApiResponse<bool>> updateNote(
      {required AddNoteModel updateNote, required String noteId}) async {
    logger.e(noteId);
    logger.w(updateNote.noteTitle, updateNote.noteContent);
    try {
      Uri uri = Uri.parse(baseUrl + "/notes/${noteId}");

      Map<String, dynamic> note = updateNote.toJson();

      final json = jsonEncode(note);

      final response = await http.put(uri, headers: header, body: json);
      final respStat = response.statusCode;
      switch (respStat) {
        case 204:
          return ApiResponse<bool>(data: true);

        default:
          return ApiResponse<bool>(
              error: true, errorMessage: "Not updated", data: false);
      }
    } catch (e) {
      return ApiResponse<bool>(
          error: true, errorMessage: "Whole Error", data: false);
    }
  }
}


// id pass *
// read data old and new *
// data -> service


//build calcultor 25 to 100 
// name
// age
// on click
// 2 days 
// take refrence internet use good colors
// mannan is 25 and will be 100 in 75 years 
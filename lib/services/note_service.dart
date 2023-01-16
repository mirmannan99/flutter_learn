import 'package:http/http.dart' as http;

import '../model/note_list.dart';

class ApiServices {
  static const baseUrl = "https://tq-notes-api-jkrgrdggbq-el.a.run.app";
  final header = {"apiKey": "a571f9b6-33f7-4cf7-a80f-8f08563d8a48"};

  Future<List<Notes?>?> getNotes() {
    Uri uri = Uri.parse(baseUrl + "/notes");

    return http.get(uri, headers: header).then((value) {
      return notesFromJson(value.body);
    });
  }
}

// data //error // ui reprsent

//header
//body

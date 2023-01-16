import 'dart:convert';

List<Notes?>? notesFromJson(String str) => json.decode(str) == null
    ? []
    : List<Notes?>.from(json.decode(str)!.map((x) => Notes.fromJson(x)));

String notesToJson(List<Notes?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class Notes {
  Notes({
    this.noteId,
    this.noteTitle,
    this.createDateTime,
    this.latestEditDateTime,
  });

  String? noteId;
  String? noteTitle;
  DateTime? createDateTime;
  dynamic latestEditDateTime;

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        noteId: json["noteID"],
        noteTitle: json["noteTitle"],
        createDateTime: DateTime.parse(json["createDateTime"]),
        latestEditDateTime: json["latestEditDateTime"],
      );

  Map<String, dynamic> toJson() => {
        "noteID": noteId,
        "noteTitle": noteTitle,
        "createDateTime": createDateTime?.toIso8601String(),
        "latestEditDateTime": latestEditDateTime,
      };
}

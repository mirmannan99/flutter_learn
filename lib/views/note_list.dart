import 'package:flutter/material.dart';
import 'package:mohsin/controller/api_controller.dart';
import 'package:mohsin/services/note_service.dart';
import 'package:mohsin/views/single_note.dart';

import '../model/note_list.dart';
import '../model/single_note.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  final ApiServices _apiServices = ApiServices();
  late ApiResponse<List<Note>> response;
  bool _isLoading = false;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    setState(() {
      _isLoading = true;
    });
    response = await _apiServices.getNotes();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
                children: response.data!
                    .map((e) => ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SingleNoteView(
                                  noteId: e.noteID,
                                ),
                              ),
                            );
                          },
                          title: Text(e.noteTitle!),
                          subtitle: Text(
                              "${e.latestEditDateTime ?? e.createDateTime}"),
                        ))
                    .toList(),
              ),
            ),
    );
  }
}

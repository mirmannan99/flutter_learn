import 'package:flutter/material.dart';
import 'package:mohsin/controller/api_controller.dart';
import 'package:mohsin/services/note_service.dart';
import 'package:mohsin/views/add_note.dart';
import 'package:mohsin/views/single_note.dart';

import '../model/note_list.dart';
import '../model/single_note.dart';

class NoteListView extends StatefulWidget {
  const NoteListView({Key? key}) : super(key: key);

  @override
  State<NoteListView> createState() => _NoteListViewState();
}

class _NoteListViewState extends State<NoteListView> {
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
                          title: Text(e.noteTitle ?? "no Title"),
                          subtitle: Text(
                              "${e.latestEditDateTime ?? e.createDateTime ?? "no data"} "),
                        ))
                    .toList(),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNoteView(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

//start from begining to handle errors and check
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:logger/logger.dart';
import 'package:mohsin/controller/api_controller.dart';
import 'package:mohsin/services/note_service.dart';

import '../model/single_note.dart';

class SingleNoteView extends StatefulWidget {
  String? noteId;
  SingleNoteView({this.noteId, super.key});

  @override
  State<SingleNoteView> createState() => _SingleNoteViewState();
}

class _SingleNoteViewState extends State<SingleNoteView> {
  Logger logger = Logger();

// service object
  final ApiServices _apiServices = ApiServices();

  late ApiResponse<SingleNote> response;

  bool _isLoading = false;

  // to get the data according to our need // note id
  //fetch //api seviceobject //fetch functionCall  //response
  // ui element CircularInidcator
  //ui

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    fetch();
    super.initState();
  }

  void fetch() async {
    setState(() {
      _isLoading = true;
    });
    response = await _apiServices.getNote(noteId: widget.noteId!);

    /// to show the response inside the text field as we load the page
    _titleController.text = response.data!.noteTitle!;
    _contentController.text = response.data!.noteContent!;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Note"),
      ),
      body: Builder(builder: (context) {
        if (_isLoading) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: LinearProgressIndicator(),
          ));
        }

        return SafeArea(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: "Title",
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _contentController,
                    decoration: InputDecoration(
                      hintText: "Content",
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Submit")),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

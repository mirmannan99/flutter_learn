import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:mohsin/model/add_note.dart';
import 'package:mohsin/services/note_service.dart';
import 'package:mohsin/views/note_list.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  ApiServices createService = ApiServices();
  GlobalKey<FormState> formKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value!.isEmpty ? "enter title" : null,
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: "Title",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value!.isEmpty ? "enter content" : null,
                  controller: _contentController,
                  decoration: InputDecoration(
                    hintText: "Content",
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final addNote = AddNoteModel(
                            noteContent: _contentController.text,
                            noteTitle: _titleController.text);

                        final result = await createService.addNote(addNote);

                        final titleText =
                            result.error! ? result.errorMessage : "Done";
                        if (result.data!) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(titleText!),
                                content: Text(_titleController.text),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => NoteListView(),
                                        ),
                                      );
                                    },
                                    child: Text("ok"),
                                  )
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                    child: Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// data // object-> service
//service creation 
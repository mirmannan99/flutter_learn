import 'package:flutter/material.dart';

class WidgetTest extends StatefulWidget {
  WidgetTest({Key? key}) : super(key: key);

  @override
  State<WidgetTest> createState() => _WidgetTestState();
}

class _WidgetTestState extends State<WidgetTest> {
  int listNumber = 1;

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isVisible
            ? alertDialog()
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    ListView(
                      shrinkWrap: true,
                      children: [
                        ListTile(
                          onTap: () {
                            setState(() {
                              isVisible = true;
                            });
                          },
                          title: Text('list tile ${listNumber++}'),
                          hoverColor: Colors.red,
                          tileColor: Colors.lightBlueAccent,
                        ),
                        ListTile(
                          onTap: () {
                            setState(() {
                              isVisible = true;
                            });
                          },
                          title: Text('list tile ${listNumber++}'),
                          hoverColor: Colors.red,
                          tileColor: Colors.lightBlueAccent,
                        ),
                        ListTile(
                          onTap: () {
                            setState(() {
                              isVisible = true;
                            });
                          },
                          title: Text('list tile ${listNumber++}'),
                          hoverColor: Colors.red,
                          tileColor: Colors.lightBlueAccent,
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
      ),
    );
  }

  Widget alertDialog() {
    return AlertDialog(
      title: Text(
        "list tile",
      ),
      content: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
      actions: [
        TextButton(
            onPressed: () {
              print("i am accepted");
              setState(() {
                isVisible = false;
              });
            },
            child: Text("Yes")),
        TextButton(
            onPressed: () {
              print("i am rejected");
              setState(() {
                isVisible = false;
              });
            },
            child: Text("No")),
      ],
    );
  }
}

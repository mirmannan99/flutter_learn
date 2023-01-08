import 'package:flutter/material.dart';

class WidgetTest extends StatefulWidget {
  WidgetTest({Key? key}) : super(key: key);

  @override
  State<WidgetTest> createState() => _WidgetTestState();
}

class _WidgetTestState extends State<WidgetTest> {
  int listNumber = 1;

  bool isVisible = false;
  bool isText2Visible = false;
  bool isText3Visible = false;
  bool isButtonVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  if (value.length > 3) {
                    setState(() {
                      isText2Visible = true;
                    });
                  }

                  if (value.length < 3) {
                    setState(() {
                      isText2Visible = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: isText2Visible,
                child: TextField(
                  onChanged: (value) {
                    if (value.length > 3) {
                      setState(() {
                        isText3Visible = true;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: isText3Visible && isText2Visible,
                child: TextField(
                  onChanged: (value) {
                    if (value.length > 3) {
                      setState(() {
                        isButtonVisible = true;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                  visible: isButtonVisible && isText3Visible && isText2Visible,
                  child:
                      ElevatedButton(onPressed: () {}, child: Text("Submit"))),
            ],
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

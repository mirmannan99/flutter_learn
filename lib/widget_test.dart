import 'package:flutter/material.dart';

class WidgetTest extends StatefulWidget {
  WidgetTest({Key? key}) : super(key: key);

  @override
  State<WidgetTest> createState() => _WidgetTestState();
}

class _WidgetTestState extends State<WidgetTest> {
  late bool _isLoading;

  void getdata() async {
    _isLoading = true;

    await Future.delayed(
        Duration(seconds: 2),
        () => {
              //debug
              //jit just in time
              //c#
              //aot ahead of time
              debugPrint("hii how are you"),
            });
    _isLoading = false;
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              _isLoading
                  ? CircularProgressIndicator()
                  : Card(
                      child: Text(
                        "hello worlds",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isLoading = false;
                    });
                  },
                  child: Text("Loading finsihed"))
            ],
          ),
        ),
      ),
    );
  }
}

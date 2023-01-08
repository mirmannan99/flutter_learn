import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "please enter the email";
                } else if (value.length < 5) {
                  return "email should be greater than 5";
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.black26),
                suffixIcon: Icon(
                  Icons.email,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "please enter the password";
                } else if (value.length < 5) {
                  return "password should be greater than 5";
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: showPassword,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.black26),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                    )),
              ),
            ),
            Text(
              "mannan",
              style: TextStyle(
                fontSize: ((100) * (25 / 100)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('validated');
                  }
                },
                child: Text('Submit')),
          ],
        ),
      ),
    );
  }
}

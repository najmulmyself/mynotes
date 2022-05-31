import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../firebase_options.dart';
// import 'firebase_options.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

// late final TextEditingController _email;
// late final TextEditingController _password;

// @override
// void initState() {
//   _email = TextEditingController();
//   _password = TextEditingController();
//   super.initState();
// }

class _HomepageState extends State<Homepage> {
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _password = TextEditingController();

  @override
  void initState() {
    // _email = TextEditingController();
    // _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          return Column(
            children: [
              TextField(
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                decoration: InputDecoration(hintText: 'enter your email here'),
              ),
              TextField(
                obscureText: true,
                controller: _password,
                decoration:
                    InputDecoration(hintText: 'enter your password here'),
              ),
              TextButton(
                onPressed: () async {
                  // await Firebase.initializeApp(
                  //   options: DefaultFirebaseOptions.currentPlatform,
                  // );
                  final email = _email.text;
                  final password = _password.text;
                  final userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  print(userCredential);
                },
                child: const Text('Register'),
              ),
            ],
          );
        },
      ),
    );
  }
}

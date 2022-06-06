import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/firebase_options.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user?.emailVerified ?? false) {
                //user!.emailVerified
                //user?.emailVerified ?? false
                //if this is null then make it false

                print('User is Verified');
              } else {
                print('User is Not verified');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerifyEmail(),
                  ),
                );
              }
              return Text('done');
            default:
              return Text('loading....');
          }
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Email'),
      ),
      body: Column(
        children: [
          Text('Please verify your email address',),
          TextButton(
            onPressed: () {},
            child: Text('send verification code'),
          ),
        ],
      ),
    );
  }
}

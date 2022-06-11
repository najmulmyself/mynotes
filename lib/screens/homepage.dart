import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/firebase_options.dart';
import 'package:mynotes/screens/login_view.dart';
import 'package:mynotes/screens/registration_view.dart';
import 'package:mynotes/screens/verify_email.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                print('Email is verified');
              } else {
                print('111: $user komuna');
                return VerifyEmail();
              }
            } else {
              return LoginView();
            }

            // print(user);
            // if (user?.emailVerified ?? false) {
            //   return const Text('done');
            //   //user!.emailVerified
            //   //user?.emailVerified ?? false
            //   //if this is null then make it false

            // }
            //  else {
            //   return VerifyEmail();
            //   // Navigator.push(
            //   //   context,
            //   //   MaterialPageRoute(
            //   //     builder: (context) => VerifyEmail(),
            //   //   ),
            //   // );
            // }
            return const LoginView();
          // return Text('Hello There');
          // return Text('done');
          default:
            return const CircularProgressIndicator();
        }
      },
    );
    // );
  }
}

// import 'package:flutter/material.dart';
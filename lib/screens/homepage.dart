import 'package:flutter/material.dart';

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
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
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
        title: const Text('Register'),
      ),
      body: Column(
        children: [
          const TextField(
            decoration: InputDecoration(hintText: 'enter your email here'),
          ),
          const TextField(
            decoration: InputDecoration(hintText: 'enter your password here'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}

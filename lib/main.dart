import 'package:arthur/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Arthur());
}

class Arthur extends StatelessWidget {
  const Arthur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arthur Subscriber Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
      },
    );
  }
}

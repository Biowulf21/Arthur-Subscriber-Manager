import 'package:arthur/screens/login_screen.dart';
import 'package:arthur/services/google_sign_in_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Arthur());
}

class Arthur extends StatelessWidget {
  const Arthur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSigninProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Arthur Subscriber Manager',
        theme: ThemeData(brightness: Brightness.dark),
        initialRoute: LoginPage.id,
        routes: {
          LoginPage.id: (context) => LoginPage(),
        },
      ),
    );
  }
}

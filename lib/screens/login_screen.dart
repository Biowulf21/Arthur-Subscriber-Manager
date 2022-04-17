import 'package:arthur/screens/homepage.dart';
import 'package:arthur/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  static const String id = "login_page";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Home();
          } else {
            return Scaffold(
              body: LoginWidget(widget: widget),
            );
          }
        });
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final LoginPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomTextField(
            controller: widget.emailController,
            fieldText: "Email",
            hintText: "example@example.com",
            leadingIcon: Icons.email,
            suffixIcon: FontAwesomeIcons.cross),
        CustomTextField(
            controller: widget.passwordController,
            fieldText: "Password",
            hintText: "Password",
            leadingIcon: Icons.lock,
            isHiddenField: true,
            suffixIcon: Icons.close),
        ElevatedButton(
          onPressed: () {
            final String email = widget.emailController.text.trim();
            final String password = widget.passwordController.text.trim();

            FirebaseAuth.instance
                .signInWithEmailAndPassword(email: email, password: password);
            print('email is: $email');
            print('password is: $password');
            print('here');
          },
          child: const Text('Login'),
        )
      ],
    );
  }
}

import 'package:arthur/screens/homepage.dart';
import 'package:arthur/services/google_sign_in_service.dart';
import 'package:arthur/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

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
            return Home();
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
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
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(
            indent: 20.0,
            endIndent: 20.0,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SocialLoginButton(
              buttonType: SocialLoginButtonType.google,
              onPressed: () {
                final provider =
                    Provider.of<GoogleSigninProvider>(context, listen: false);

                provider.googleLogin();
              }),
        ),
      ],
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/constants.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';
import 'package:twitter_clone/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone/theme/pallete.dart';
import 'package:twitter_clone/common/common.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static route() => MaterialPageRoute(
  builder: (context) => const SignUpView()
  );
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passWordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passWordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                AuthField(controller: emailController, hintText: 'Email'),
                const SizedBox(
                  height: 25,
                ),
                AuthField(controller: passWordController, hintText: 'Password'),
                const SizedBox(
                  height: 40,
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: RoundedSmallButton(
                      onTap: () {},
                      label: 'Done',
                      backgroundColor: Pallete.whiteColor,
                      textColor: Pallete.backgroundColor,
                    )),
                const SizedBox(
                  height: 40,
                ),
                RichText(
                    text: TextSpan(
                        text: "Already have an account?",
                        style: const TextStyle(fontSize: 16),
                        children: [
                      TextSpan(
                          text: ' Login',
                          style: const TextStyle(
                            color: Pallete.blueColor,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,LoginView.route()
                              );
                            })
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

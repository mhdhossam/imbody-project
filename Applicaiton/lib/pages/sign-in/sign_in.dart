import 'package:animate_do/animate_do.dart';
import 'package:fitgenie/pages/sign-in/sign_in_provider/sign_in_provider.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../core/widgets/logo_splash_widget.dart';


class SignInPage extends StatefulWidget {
  static const String routeName = '/sign-in';

  const SignInPage({super.key});
  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
       Center(
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              FadeInDown(
                  duration: const Duration(milliseconds: 700),
                  child: const LogoSplashWidget()),
              const SizedBox(height: 10),
              Form(
                key: signInFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _emailController,
                      suffixIcon: const Icon(Icons.email_rounded),
                      label: 'Email',
                      keyBoardType: TextInputType.emailAddress,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomTextField(
                      delay: const Duration(milliseconds: 200),
                      controller: _passwordController,
                      label: 'Password',
                      isPassword: true,
                      keyBoardType: TextInputType.visiblePassword,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 300),
                      duration: const Duration(milliseconds: 700),
                      child: LongButton(
                        label: 'Sign In',
                        onTap: () {
                          signIn(signInFormKey, _emailController, _passwordController);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
      );

  }
}

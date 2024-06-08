import 'package:animate_do/animate_do.dart';
import 'package:fitgenie/layout/basic_layout_page.dart';
import 'package:fitgenie/pages/sign-in/sign_up/required_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../fire_base/firebase.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/sign-up';

  const SignUpPage({super.key});
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    return Center(
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: <Widget>[
          Form(
            key: signUpFormKey,
            child: Column(
              children: [
                FadeIn(
                  delay: const Duration(milliseconds: 100),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                    keyBoardType: TextInputType.name,
                    suffixIcon: const Icon(Icons.person),
                    delay: const Duration(milliseconds: 50),
                    controller: nameController,
                    label: 'Name',
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      } else {
                        //print('name is valid');
                        return null;
                      }
                    }),
                CustomTextField(
                    controller: emailController,
                    delay: const Duration(milliseconds: 100),
                    suffixIcon: const Icon(Icons.email),
                    label: 'Email',
                    keyBoardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      } else {
                        //print('email is valid');
                        return null;
                      }
                    }),
                CustomTextField(
                    controller: passwordController,
                    delay: const Duration(milliseconds: 150),
                    label: 'Password',
                    isPassword: true,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      } else if (!value.contains(RegExp(r'[A-Z]'))) {
                        return 'Password must contain at least one uppercase letter';
                      } else if (!value.contains(RegExp(r'[a-z]'))) {
                        return 'Password must contain at least one lowercase letter';
                      } else {
                        //print('password is valid');
                        return null;
                      }
                    }),
                CustomTextField(
                    controller: passwordConfirmController,
                    delay: const Duration(milliseconds: 200),
                    label: 'Confirm Password',
                    isPassword: true,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      } else if (value != passwordController.text) {
                        return 'Passwords do not match';
                      } else {
                        //print('password is valid');
                        return null;
                      }
                    }),
                FadeInUp(
                  delay: const Duration(milliseconds: 350),
                  child: LongButton(
                      label: 'Sign Up',
                      onTap: () {
                        //signUp();
                        Get.to(
                            () => const LayOutPageView(
                                appBarTitle: 'Required Data',
                                body: RequiredForm()),
                            transition: Transition.leftToRight);
                        //print('signup');
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  signUp() async {
    if (signUpFormKey.currentState!.validate()) {
      await saveSignToFireBase(
        emailController.text,
        passwordController.text,
        nameController.text,
      );
    } else {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        colorText: Colors.white,
        duration: const Duration(milliseconds: 1500),
        icon: const Icon(Icons.error, color: Colors.white),
        margin: const EdgeInsets.only(bottom: 5, left: 0, right: 0),
        borderRadius: 15,
      );
    }
  }
}

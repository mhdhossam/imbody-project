import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../fire_base/firebase.dart';

void signIn(signInFormKey, emailController, passwordController) {
  if (signInFormKey.currentState!.validate()) {
    signInFireBase( emailController, passwordController);
    //Get.to(() => const HomeLayout(),transition: Transition.rightToLeft);
  } else {
    Get.snackbar(
      'Error',
      'Please enter valid email and password',
      duration: const Duration(milliseconds: 1500),
      margin: const EdgeInsets.only(bottom: 5, left: 0, right: 0),
      borderRadius: 15,
    );
  }
}
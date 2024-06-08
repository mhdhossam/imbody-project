import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitgenie/layout/sign_in_layout/sign_in_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/widgets/logo_splash_widget.dart';
import '../../layout/home_layout.dart';
class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (FirebaseAuth.instance.currentUser == null){
        Get.offNamed(SignInLayout.routeName);
      }else if (FirebaseAuth.instance.currentUser != null){
        Get.offNamed(HomeLayout.routeName);
      }
    });
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          FadeIn(
              delay: const Duration(milliseconds: 400),
              duration: const Duration(milliseconds: 1200),
              child: const LogoSplashWidget()),
          const Spacer(),
          const CircularProgressIndicator(),
          const Spacer(),
          const Text('Version 6.5.0',style: TextStyle(color: Colors.white,fontSize: 10),),
        ],
      ),
    );
  }
}

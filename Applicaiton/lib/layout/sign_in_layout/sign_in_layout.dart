import 'package:flutter/material.dart';

import '../../pages/sign-in/sign_in.dart';
import '../../pages/sign-in/sign_up/sign_up.dart';

class SignInLayout extends StatelessWidget {
  static const String routeName = '/sign-in-layout';
  const SignInLayout({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
              color: theme.primaryColor,
            ),
            child: AppBar(
                title: const Text('FitGenie'),
                bottom: const TabBar(
                    labelStyle: TextStyle(fontSize: 20),
                    indicatorColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    labelColor: Colors.white,
                    dividerHeight: 0,
                    // 12345678@fF
                    tabs: [
                      Tab(
                        text: 'Sign In',
                      ),
                      Tab(
                        text: 'Sign Up',
                      )
                    ])),
          ),
        ),
        body: const TabBarView(
          controller: null,
          physics: NeverScrollableScrollPhysics(),
          children: [SignInPage(), SignUpPage()],
        ),
      ),
    );
  }
}

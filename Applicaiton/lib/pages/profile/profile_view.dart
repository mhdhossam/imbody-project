import 'package:fitgenie/core/widgets/custom_button.dart';
import 'package:fitgenie/pages/profile/profile_widgets/profile_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../sign-in/sign_in.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = '/profile';
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 100),
        physics: const BouncingScrollPhysics(),

        children: [
          Stack(alignment: Alignment.center, children: [
            CircleAvatar(
              backgroundColor: theme.colorScheme.secondary,
              radius: 60,
              backgroundImage: const AssetImage('assets/images/profile_picture.png'),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  )),
            )
          ]),
          const SizedBox(height: 20),
          const Text(
            'islam Ashraf',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'free plan',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: theme.colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary.withOpacity(0.7),
              borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            ),
            child: ListView.builder(
              itemBuilder: (context, index) => ProfileRowWidget(),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
            ),
          ),
          LongButton(
              label: 'LogOut',
              onTap: () {
                Get.off(
                      () => const SignInPage(),
                  transition: Transition.fadeIn,
                );
              }).paddingOnly(top: 20, bottom: 20),
          // Add more details or widgets as needed
        ],
      );

  }
}

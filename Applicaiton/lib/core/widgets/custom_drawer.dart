import 'package:fitgenie/layout/basic_layout_page.dart';
import 'package:fitgenie/pages/timer/timer_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../fire_base/firebase.dart';
import '../../pages/notification/notification_view.dart';
import '../../pages/profile/profile_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        width: width * 0.8,
        decoration: BoxDecoration(
            color: theme.colorScheme.background.withOpacity(0.9),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomRight: Radius.circular(30.0),
            )),
        child: Stack(
          children: [
            Column(children: [
              Container(
                width: double.infinity,
                height: height * 0.17,
                padding: EdgeInsets.only(top: height * 0.05),
                decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    )),
                child: Center(
                  child: Text(
                    'FitGenie',
                    style: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                  child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                    ListTile(
                        iconColor: theme.primaryColor,
                        trailing: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: Text(
                          'Profile',
                          style: TextStyle(
                              color: theme.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        onTap: () {
                          Get.to(
                                () =>  const LayOutPageView(appBarTitle: 'Profile', body: ProfilePage()),
                            transition: Transition.rightToLeftWithFade,
                          );
                        }),
                    ListTile(
                      iconColor: theme.primaryColor,
                        title: Text(
                          'Notifications',
                          style: TextStyle(
                              color: theme.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: const Icon(
                          Icons.notifications_rounded,
                          size: 30,
                        ),
                        onTap: () {
                          Get.to(
                                () => const NotificationView(),
                            transition: Transition.rightToLeftWithFade,
                          );

                        }),
                    ListTile(
                      iconColor: theme.primaryColor,
                        title: Text(
                          'Timer',
                          style: TextStyle(
                              color: theme.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: const Icon(
                          Icons.timer,
                          size: 30,
                        ),
                        onTap: () {
                          Get.to(
                                () => const LayOutPageView(appBarTitle: 'news feed', body: TimerView()),
                            transition: Transition.rightToLeftWithFade,
                          );

                        }),
                    ListTile(
                        title: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                            color: theme.primaryColor.withOpacity(0.2),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Sign Out',
                                style: TextStyle(
                                    color: theme.primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.logout,
                                color: theme.colorScheme.error.withOpacity(0.8),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          signOutFireBase();
                          // Get.off(
                          //   () => const SignInPage(),
                          //   duration: const Duration(milliseconds: 500),
                          //   transition: Transition.fadeIn,
                          // );
                        }),
                  ]))
            ]),
            Positioned(
              right: 12,
              top: height / 2 - 40,
              child: Container(
                  width: 5,
                  height: 80,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  )),
            ),
          ],
        ));
  }
}

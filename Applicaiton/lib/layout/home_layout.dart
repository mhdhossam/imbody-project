import 'package:fitgenie/pages/News/news_screen.dart';
import 'package:fitgenie/pages/food/food_view.dart';
import 'package:fitgenie/pages/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../core/provider/app_provider.dart';
import '../core/widgets/custom_drawer.dart';
import '../core/widgets/my_app_bottom_navigation_bar.dart';
import '../pages/notification/notification_view.dart';
import '../pages/profile/profile_view.dart';
import '../pages/settings/setting_view.dart';
import '../pages/work_out_planes/work_out_plan_view.dart';
import 'basic_layout_page.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = '/home';

  const HomeLayout({super.key});
  static List<Widget> screens = [
    const HomeView(),
    const NewsView(),
    // const TimerView(),
    const FoodPlanView(),
    const WorkOutPlanView(),
    const SettingsView(),
  ];
  // int pageIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    var homeLayOutProvider = Provider.of<AppProvider>(context);
    PageController pageController = PageController();
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      drawer: const CustomDrawer(),
      drawerEnableOpenDragGesture:true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: theme.primaryColor,
          ),
          child: AppBar(
            title: const Text('FitGenie'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Get.to(
                    () =>  const LayOutPageView(
                      appBarTitle: 'Profile',
                      body: ProfilePage(),
                    ),
                    transition: Transition.leftToRightWithFade,
                  );
                },
              ),
              IconButton(
                onPressed: () {
                  Get.to(
                    () => const LayOutPageView(
                      appBarTitle: 'Notifications',
                      body: NotificationView(),
                    ),
                  );
                },
                icon: const Icon(Icons.notifications),
              )
            ],
          ),
        ),
      ),
      body:  PageView(
         scrollBehavior: const ScrollBehavior().copyWith(overscroll: true),
        controller: pageController,
        onPageChanged: (value) {
          // provider.changePageIndex(value);
          homeLayOutProvider.screenSwapped(value);
          // setState(() {
          //   pageIndex = value;
          // });
        },
        children: screens,
      ),
      bottomNavigationBar: MyAppBottomNavigationBar(

        pageController: pageController,
      ),

    );
  }

}

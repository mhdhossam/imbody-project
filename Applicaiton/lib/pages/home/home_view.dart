import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitgenie/core/health/health_data_model_steps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/health/health_data_fetch.dart';
import '../../core/health/health_data_model_calories.dart';
import 'home_widget/ads_container.dart';
import 'home_widget/Exercise/exercise_container.dart';
import 'home_widget/heart_rate_container_view.dart';
import 'home_widget/status_container_calories.dart';
import 'home_widget/steps_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

initState() {
  // HealthDataFetch.fetchHealthDataCalories(dataTypeName: 'active_calories', timePeriod: 'today') ;
  // HealthDataFetch.fetchHealthDataSteps(dataTypeName: 'steps_count', timePeriod: 'today') ;
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    // var steps = StepsCount().value;
    // var theme = Theme.of(context);
    // var appTheme = ApplicationTheme();
    // var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return ListView(
        padding: const EdgeInsets.only(top: 20, bottom: 120),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Row(
            children: [
              Icon(Icons.dashboard, color: Theme.of(context).colorScheme.secondary,size: 30),
              const SizedBox(width: 10),
              Text('Dashboard', style: Theme.of(context).textTheme.titleLarge),
            ],
          ).paddingOnly(left: 20),
          CarouselSlider(
              items: const [
                CaloriesContainer(),
                HeartRateContainer(),
              ],
              options: CarouselOptions(
                pageSnapping: true,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 6),
                autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollPhysics: const BouncingScrollPhysics(),
                pauseAutoPlayOnTouch: true,
                viewportFraction: .9,
                height: heightScreen * 0.345,
              )),
          const SizedBox(
            height: 20,
          ),
          const AdsContainer(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //steps
              FutureBuilder(
                  future: HealthDataFetch.fetchHealthDataSteps(
                      dataTypeName: 'steps_count', timePeriod: 'today'),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const StepsContainerView(errorStep: 0);
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const StepsContainerView(errorStep: 0);
                    } else if (snapshot.hasData) {
                      HealthDataModelSteps healthDataModel =
                          snapshot.data as HealthDataModelSteps;
                      return StepsContainerView(
                          healthDataModel: healthDataModel);
                    } else {
                      return const StepsContainerView(errorStep: 0);
                    }
                  }),
              //exercise
              FutureBuilder(
                future: HealthDataFetch.fetchHealthDataCalories(
                    dataTypeName: 'calories_expended', timePeriod: 'today'),
                builder: (BuildContext context,
                    AsyncSnapshot<HealthDataModelCalories> snapshot) {
                  if (snapshot.hasError) {
                    return const ExerciseContainer();
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const ExerciseContainer();
                  } else if (snapshot.hasData) {
                    HealthDataModelCalories healthDataModel =
                        snapshot.data as HealthDataModelCalories;
                    return ExerciseContainer(healthDataModel: healthDataModel);
                  } else {
                    return const ExerciseContainer();
                  }
                },
              )
            ],
          ),
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     StepsContainerView(),
          //     StepsContainerView(),
          //   ],
          // ),
        ]);
  }
}

import 'package:fitgenie/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../food_data/food_data.dart';
import '../food_widget/food_details_wiget_view.dart';

class MealPlanView extends StatelessWidget {
  final int index;
  const MealPlanView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    String title = FoodData.meal[index]["name"].toString();
    String image = FoodData.meal[index]["image"].toString();
    List<Map<String, dynamic>> items = FoodData.meal[index]["items"];
    return Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(bottom: 60, left: 16, right: 16, top: 20),
      child: Column(children: [
        Image.asset(image),
        const SizedBox(height: 20),
        Text("for the $title",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            )),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return FoodCheckWidgetView(
                  index: index,
                ) ;
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LongButton(
              label: 'Save',
              onTap: () {
                Get.snackbar("Saved", "Meal saved successfully",
                    snackPosition: SnackPosition.TOP,
                    padding: const EdgeInsets.all(20),
                    overlayColor: Colors.black.withOpacity(0.5),
                    margin: const EdgeInsets.all(20),
                    backgroundColor: theme.primaryColor.withOpacity(0.8),
                    colorText: Colors.white,
                    duration: const Duration(milliseconds: 1500),
                );
              },
              color: theme.colorScheme.secondary.withOpacity(0.4),
          ),
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../food_data/food_data.dart';

class FoodCheckWidgetView extends StatefulWidget {
  final int index;

  const FoodCheckWidgetView({super.key, required this.index});

  @override
  State<FoodCheckWidgetView> createState() => _FoodCheckWidgetViewState();
}

class _FoodCheckWidgetViewState extends State<FoodCheckWidgetView> {
  Color color = Theme.of(Get.context!).colorScheme.secondary.withOpacity(0.4);
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<Map<String, dynamic>> items = FoodData.meal[widget.index]["items"];

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Row(
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            reverseDuration: const Duration(milliseconds: 1000),
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              width: Get.width * 0.76,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(items[widget.index]["ItemName"]),
                      const Spacer(),
                      Text(items[widget.index]["ItemQuantity"]),
                    ],
                  ),
                  isExpanded ? Text(items[widget.index]["ItemDescription"]) : Container(),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                color = color == Colors.green
                    ? Theme.of(Get.context!)
                    .colorScheme
                    .secondary
                    .withOpacity(0.4)
                    : Colors.green;
              });
            },
            child: Icon(
              color == Colors.green
                  ? Icons.check_circle_outline
                  : Icons.circle_outlined,
              color: color,
            ),
          )
        ],
      ),
    );
  }
}

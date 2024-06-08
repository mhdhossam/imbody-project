import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/add_remove_counter.dart';

class ExerciseGame extends StatelessWidget {
  final String gameName;
  final IconData icon;
  static int gameMin = 0;
  const ExerciseGame({
    super.key,
    this.gameName = "bicycle",
    this.icon = Icons.directions_bike_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black26,
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(gameName.capitalize!.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                )),
            const Icon(
              Icons.directions_bike_outlined,
              color: Colors.amber,
              size: 24,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
            onPressed: () {
              addGame(gameName: gameName, context: context, icon: icon);
            },
            icon: const Icon(
              Icons.add_outlined,
              color: Colors.amber,
              size: 30,
            ),
          )
        ])
      ]),
    );
  }

  void addGame({
    required BuildContext context,
    required IconData icon,
    required String gameName,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return FadeIn(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            child: AlertDialog(
                icon: Icon(icon, color: Colors.amber),
                title: Text(gameName.capitalize!.toString(), style:  TextStyle(color: Get.theme.primaryColor),),
                content: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black26,
                  ),
                  child: const AddRemoveCounter()
                ),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Add'))
                ]),
          );
        });
  }
}

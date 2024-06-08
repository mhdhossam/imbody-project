import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'excercise_game_container.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Exercise',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.sports_gymnastics,
                  color: Colors.amber,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                      size: 30,
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'pick an exercise',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                  ),
                  itemCount: 16,
                  padding: const EdgeInsets.only(bottom: 80),
                  scrollDirection: Axis.vertical,
                  clipBehavior: Clip.hardEdge,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const ExerciseGame();
                  }),
            )
          ],
        ));
  }
}

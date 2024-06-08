import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CaloriesContainer extends StatefulWidget {
  const CaloriesContainer({super.key});

  @override
  State<CaloriesContainer> createState() => _CaloriesContainerState();
}

class _CaloriesContainerState extends State<CaloriesContainer> {
  @override
  Widget build(BuildContext context) {
    // double radius = 50;
    double baseGoal = 2820;
    double food = 800;
    double exerciseCal = 300;
    //double netCal = food + exerciseCal;
    double remaining = baseGoal - food + exerciseCal;
    double percent = remaining / baseGoal >= 1 ? 0 : remaining / baseGoal - 1;




    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Container(
        clipBehavior: Clip.hardEdge,
      // margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(20)
          ),
        ) ,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Calories',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            const Text('Remaining = Goal - food + Exercise',style: TextStyle(color: Colors.grey,fontSize: 14)),
            SizedBox(
              height: height*0.19,
              child: Row(
                  children: [
                    CircularPercentIndicator(
                      startAngle: 0.0,
                      animateFromLastPercent: true,
                      animationDuration: 1000,
                      radius: height*0.09,
                      progressColor: theme.primaryColor,
                      backgroundColor: Colors.white,
                      percent: percent.abs(),
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${remaining.toInt()}',style: const TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                          const Text('Remaining',style: TextStyle(color: Colors.white,fontSize: 12),),
                        ],
                      ),
                      animation: true,
                      lineWidth: 10,
                      circularStrokeCap: CircularStrokeCap.square,

                    ),
                    const Spacer(),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            const Icon(Icons.flag_rounded,size: 30,),
                            const SizedBox(width: 10,),
                            Text('Base Goal\n ${baseGoal.toInt()}',style: const TextStyle(color: Colors.white,fontSize: 14),),
                          ],),
                          Row(children: [
                            const Icon(Icons.fastfood_rounded,size: 30,),
                            const SizedBox(width: 10,),
                            Text('Food\n ${food.toInt()}',style: const TextStyle(color: Colors.white,fontSize: 14),),
                          ],),
                          Row(children: [
                            const Icon(Icons.local_fire_department_rounded,size: 30,),
                            const SizedBox(width: 10,),
                            Text('Exercise\n ${exerciseCal.toInt()}',style: const TextStyle(color: Colors.white,fontSize: 14),),
                          ],)
                        ]
                    )
                  ]
              ),
            ),
          ],
        )
    );
  }
}

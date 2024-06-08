import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/health/health_data_model_steps.dart';

class StepsContainerView extends StatelessWidget {
  // StepsContainerView({super.key, required this.steps});
  final int? errorStep ;
  final HealthDataModelSteps? healthDataModel;
  final int? stepsGoal = 1000;
   const StepsContainerView({super.key, this.healthDataModel, this.errorStep});
  @override
  Widget build(BuildContext context) {
    int? steps =  healthDataModel?.stepsCount?[0].value ?? 77;
    double linearPercent = (steps / stepsGoal!) * 100;


    return Container(
      height: 140,
      width: 180,
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'steps',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svg/running_shoe.svg',
                  height: 30,
                  width: 30,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                 Text('$steps', style: const TextStyle(color: Colors.white)),
              ],
            ),
            Row(
              children: [
                 Text(
                  'Goal: $stepsGoal',
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const Spacer(),
                Text(
                  '${linearPercent.toStringAsFixed(2)} %',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                )
              ],
            ),
            LinearProgressIndicator(
              value: steps / stepsGoal!,
              backgroundColor: Colors.white,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Color(0xffFFC107)),
              minHeight: 4,
              borderRadius: BorderRadius.circular(20),
            ),
          ]),
    );
  }
}

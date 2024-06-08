import 'package:fitgenie/pages/work_out_planes/widget/work_out_item-container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkOutPlanView extends StatelessWidget {
  const WorkOutPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(Icons.fitness_center_sharp, color: theme.colorScheme.secondary),
              const SizedBox(width: 10),
              Text(
                'WorkOut Plan',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.start,
              ),
            ],
          ).paddingOnly(top: 20, left: 20),
          const SizedBox(
            height: 20
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(bottom: 120, left: 20, right: 20),
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index)=> const WorkOutWidgetItem(),
              separatorBuilder: (context, index) => const SizedBox(height: 20,),
            ),
          )

        ]);
  }
}

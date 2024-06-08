import 'package:fitgenie/core/widgets/custom_button.dart';
import 'package:fitgenie/layout/basic_layout_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../work_out_details_page_view.dart';

class WorkOutWidgetItem extends StatelessWidget {
  const WorkOutWidgetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(20),
      ),
      child:  Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image(image: AssetImage('assets/images/cardio.png'), filterQuality: FilterQuality.high,)),
          const SizedBox(height: 10),
          const Text('Cardio', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 18),),
          const Text('Total Body Power', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 20),),
          const Text('28 Days . 4 Days per week', textAlign: TextAlign.left, style: TextStyle(color: Colors.grey, fontSize: 15),),
          const SizedBox(height: 10),
          LongButton(label: 'View Details', onTap: (){
            Get.to(const LayOutPageView(appBarTitle: 'Cardio', body: WorkOutDetails(),));
          }),
        ],
      ),
    );
  }
}

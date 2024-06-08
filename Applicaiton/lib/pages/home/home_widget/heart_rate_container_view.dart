import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class HeartRateContainer extends StatelessWidget {
  const HeartRateContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.all(Radius.circular(20)
        ),
      ) ,
      padding: const EdgeInsets.all(20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Heart Rate',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            const Text('BPM',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.normal),),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svg/heart-svgrepo-com.svg',
                  // ignore: deprecated_member_use
                  color: Colors.redAccent,
                  height: 150,
                  width: 150,
                ),
                const Spacer(),
                const Text('${120} ',style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),),
                const Text('BPM',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.normal),),
              ],
            ),
          ]
      ),
    );
    // return FutureBuilder(
    //   future: HealthDataFetch.fetchHealthDataHeartRate(timePeriod: '30days'),
    //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     } else if (snapshot.hasError) {
    //       return const Center(
    //         child: Text('Error'),
    //       );
    //     }else if (snapshot.hasData) {
    //       HealthDataModelHeartRate healthDataModel = snapshot.data;
    //       int? rate = healthDataModel.heartMinutes?[0].value;
    //       return Container(
    //         clipBehavior: Clip.hardEdge,
    //         decoration: const BoxDecoration(
    //           color: Colors.black26,
    //           borderRadius: BorderRadius.all(Radius.circular(20)
    //           ),
    //         ) ,
    //         padding: const EdgeInsets.all(20),
    //         child: Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             crossAxisAlignment: CrossAxisAlignment.stretch,
    //             children: [
    //               const Text('Heart Rate',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
    //               const Text('BPM',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.normal),),
    //               Row(
    //                 children: [
    //                   SvgPicture.asset(
    //                     'assets/svg/heart-svgrepo-com.svg',
    //                     color: Colors.redAccent,
    //                     height: 150,
    //                     width: 150,
    //                   ),
    //                   const Spacer(),
    //                   Text('${rate??0} ',style: const TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),),
    //                   const Text('BPM',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.normal),),
    //                 ],
    //               ),
    //             ]
    //         ),
    //       );
    //     }else {
    //       return const Center(
    //         child: Text('Error')
    //       );
    //     }
    // },
    // );
  }
}

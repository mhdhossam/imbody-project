// import 'package:flutter/material.dart';
// import 'package:flutter_3d_controller/flutter_3d_controller.dart';
// class ModelTestView extends StatelessWidget {
//   const ModelTestView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     String src_3d = 'assets/models/male_anatomy_figure.glb';
//     var theme = Theme.of(context);
//     Flutter3DController controller = Flutter3DController();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Model Viewer"),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(20),
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         children: [
//           // Container(
//           //   height: height*0.45,
//           //   width: width,
//           //   decoration: BoxDecoration(
//           //     borderRadius: BorderRadius.circular(20),
//           //     color: theme.colorScheme.secondary,
//           //   ),
//           //   child: const ModelViewer(
//           //     src: "assets/models/low_poly_male_body_base.glb",
//           //     alt: "A 3D model",
//           //     ar: false,
//           //     autoRotate: false,
//           //     cameraControls: false,
//           //     cameraOrbit: "0deg 90deg 0deg",
//           //     cameraTarget: "0 0 0",
//           //     shadowIntensity: 0.5,
//           //   ),
//           // ),
//           Container(
//             height: height*0.45,
//             width: width,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: theme.colorScheme.secondary,
//             ),
//             child:Flutter3DViewer(
//               controller: controller,
//               // src: "assets/models/low_poly_male_body_base.glb",
//               src: src_3d,
//             ) ,
//           ),
//
//           ElevatedButton(
//             onPressed: () async {
//               await controller.getAvailableAnimations();
//               //print(await controller.getAvailableAnimations());
//               controller.setCameraTarget(0.3, 0.2, 0.4);
//             },
//             child: const Text("Back"),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               controller.setCameraOrbit(0, 0, 0);
//             },
//             child: const Text("set camera orbit"),
//           )
//
//
//         ],
//       ),
//     );
//   }
// }

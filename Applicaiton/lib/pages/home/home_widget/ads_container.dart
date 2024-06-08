import 'package:flutter/material.dart';
import '../../premium/premium_plans_view.dart';

class AdsContainer extends StatelessWidget {
  const AdsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            enableDrag: true,
            isScrollControlled: true,
            useSafeArea: true,
            showDragHandle: true,
            context: context,
            builder: (context) => const PremiumPlansView()
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child:  const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Go Premium',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}

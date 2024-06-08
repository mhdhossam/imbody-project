import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color? color;
  final IconData? icon;
  final Color fontColor;
  final Color iconColor;
  const LongButton({
    super.key,
    required this.label,
    required this.onTap,
    this.color,
    this.icon,
    this.fontColor = Colors.white,
    this.iconColor = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        // margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: color ?? theme.secondaryHeaderColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(color: fontColor, fontSize: 18),
            ),
            const Spacer(),
            Icon(
              icon ?? Icons.arrow_forward,
              color: iconColor,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}

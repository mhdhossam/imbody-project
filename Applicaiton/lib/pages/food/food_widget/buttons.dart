import 'package:flutter/material.dart';


class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double fontSize;
  final FontWeight fontWeight;

  const RoundButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.fontSize=20,
    this.fontWeight=FontWeight.w700,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return MaterialButton(onPressed: onPressed,
      textColor: Colors.white,
      color: theme.colorScheme.onPrimary,
      height: 30,
      elevation: 5,
      padding: const EdgeInsets.all(0),
      minWidth: double.maxFinite,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)) ,
      child: Center(
        child: Text(title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),),
      ), );
  }
}
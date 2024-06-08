import 'package:flutter/material.dart';

class LogoSplashWidget extends StatelessWidget {
  final double width = 20;
  final double height = 10;

  const LogoSplashWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
      ),
      child:  Center(
          child: AnimatedContainer( duration: const Duration(milliseconds: 700),
            padding:EdgeInsets.symmetric(horizontal: width,vertical: height) ,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary,
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Text(
                'FitGenie',
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                    fontFamily: 'Lobster',
                    fontStyle: FontStyle.italic,
                    shadows: const [
                      Shadow(
                        color: Colors.white,
                        blurRadius: 10.0,
                        offset: Offset(1.0, 1.0),
                      )
                    ]
                )
            ),
          )
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfileRowWidget extends StatelessWidget {
  ProfileRowWidget({super.key});
  final List <Widget> children = [
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          )
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('name',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
          Text('islam',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)],),
    ) ;
  }
}

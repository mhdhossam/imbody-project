import 'package:flutter/material.dart';

class AddRemoveCounter extends StatefulWidget {

  const AddRemoveCounter({super.key});

  @override
  State<AddRemoveCounter> createState() => _AddRemoveCounterState();
}

class _AddRemoveCounterState extends State<AddRemoveCounter> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      IconButton(
          onPressed: () {
            setState(() {counter++;});
          },
          icon: const Icon(Icons.add)),
      Text(
        "$counter h",
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      IconButton(
          onPressed: () {
            if (counter > 0) {
              counter--;
            } else {
              counter = 0;
            }
            setState(() {});
          },
          icon: const Icon(Icons.remove)),
    ]);
  }
}

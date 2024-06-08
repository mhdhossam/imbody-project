import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../provider/app_provider.dart';

class DropDownBarTheme extends StatefulWidget {

  const DropDownBarTheme({super.key});

  @override
  State<DropDownBarTheme> createState() => _DropDownBarState();

}

class _DropDownBarState extends State<DropDownBarTheme> {
  //final List<String> _items = ["Light", "Dark"];
  ThemeController themeController = Get.find();

  late  String _selected = themeController.currentTheme;
  @override
  void initState() {
    super.initState();
    _selected = themeController.currentTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottomSheet(context);
      },
      onDoubleTap: () {
        setState(() {
          _selected = _selected == "Light" ? "Dark" : "Light";
          themeController.changeTheme(_selected);
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "App Theme",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Text(
                  _selected ,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[700]),
                ),
                const Spacer(),
                Icon(
                  Icons.keyboard_double_arrow_down_rounded,
                  color: Colors.grey[700],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
        ),
        context: context,
        builder: (context) {
          return Column(
            children: [
              const Text(
                "Choose Theme",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    _selected = "Light";
                    themeController.changeTheme("Light");
                    Get.back();
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Light',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey[700]),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.light_mode,
                        color: Colors.grey[700],
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    _selected = "Dark";
                    themeController.changeTheme("Dark");
                    Get.back();
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Dark',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey[700]),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.dark_mode,
                        color: Colors.grey[700],
                      )
                    ],
                  ),
                ),
              )
            ],
          ) ;
        });

  }
}

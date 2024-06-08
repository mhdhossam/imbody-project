import 'package:animate_do/animate_do.dart';
import 'package:fitgenie/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_drop_down/custom_drop_down_par.dart';
import '../../../core/widgets/custom_text_field.dart';

class RequiredForm extends StatefulWidget {
  static const String routeName = '/requiredForm';
  const RequiredForm({super.key});

  @override
  State<RequiredForm> createState() => _RequiredFormState();
}

class _RequiredFormState extends State<RequiredForm> {
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController secondNameController = TextEditingController();

  final TextEditingController weightController = TextEditingController();

  final TextEditingController heightController = TextEditingController();

  final TextEditingController diseaseController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  String genderLabel = 'Gender';
  String? genderValue;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
          key: null,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              CustomTextField(
                controller: firstNameController,
                label: 'Name',
                suffixIcon: const Icon(Icons.person),
                keyBoardType: TextInputType.name,
                delay: const Duration(milliseconds: 50),
                validator: (String? value) {
                  return null;
                },
              ),
              CustomTextField(
                controller: secondNameController,
                label: 'Second Name',
                suffixIcon: const Icon(Icons.person_3_outlined),
                keyBoardType: TextInputType.name,
                delay: const Duration(milliseconds: 100),
                validator: (String? value) {
                  return null;
                },
              ),
              FadeInUp(
                  duration: const Duration(milliseconds: 400),
                  delay: const Duration(milliseconds: 150),
                  child: CustomDropDown(
                    label: genderLabel,
                    items: const ['Male', 'Female'],
                    iconItems: const [Icons.male, Icons.female],
                    onChanged: (String? value) {
                      setState(() {genderLabel = value ?? 'Gender';});
                      genderValue = value;
                    },
                  )),
              CustomTextField(
                controller: weightController,
                label: 'Weight (kg)',
                suffixIcon: const Icon(Icons.monitor_weight),
                keyBoardType: TextInputType.number,
                delay: const Duration(milliseconds: 200),
                validator: (String? value) {
                  return null;
                },
              ),
              CustomTextField(
                controller: heightController,
                suffixIcon: const Icon(Icons.height),
                label: 'Height (cm)',
                keyBoardType: TextInputType.number,
                delay: const Duration(milliseconds: 250),
                validator: (String? value) {
                  return null;
                },
              ),
              CustomTextField(
                controller: ageController,
                label: 'Age',
                keyBoardType: TextInputType.number,
                suffixIcon: const Icon(Icons.calendar_month),
                delay: const Duration(milliseconds: 300),
                validator: (String? value) {
                  return null;
                },
              ),
              CustomTextField(
                controller: diseaseController,
                label: 'Disease',
                suffixIcon: const Icon(Icons.health_and_safety),
                keyBoardType: TextInputType.name,
                delay: const Duration(milliseconds: 350),
                validator: (String? value) {
                  return null;
                },
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 400),
                child: LongButton(label: 'submit', onTap: () {
                  // print(genderValue);
                  // print(firstNameController.text);
                  // print(secondNameController.text);
                  // print(weightController.text);
                  // print(heightController.text);
                  // print(diseaseController.text);
                  // print(ageController.text);
                }),
              )
            ]),
          ),
        ));
  }
}

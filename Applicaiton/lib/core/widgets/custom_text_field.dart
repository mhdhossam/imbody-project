
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final Icon? suffixIcon;
  final TextInputType? keyBoardType;
  final FormFieldValidator<String>? validator;
  final Duration delay ;
  final Duration duration;


  const CustomTextField({
      required this.controller,
      required this.label,
      super.key,
      this.isPassword = false,
      this.suffixIcon,
      this.keyBoardType,
      this.validator,
      this.duration = const Duration(milliseconds: 400),
      this.delay = const Duration(milliseconds: 100),
  });
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}
class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    return FadeInUp(
      duration: widget.duration,
      delay: widget.delay,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: TextFormField(
          keyboardType: widget.keyBoardType,
          validator: widget.validator,
          obscureText: widget.isPassword ? obscureText : false,
          controller: widget.controller,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: obscureText ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                  )
                : widget.suffixIcon,
            suffixIconColor: Colors.grey,
            filled: true,
            fillColor: Colors.grey[200],
            floatingLabelBehavior: FloatingLabelBehavior.never,

            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

            labelText: widget.label,
            labelStyle: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            )),
          ),
        ),
      ),
    );
  }
}

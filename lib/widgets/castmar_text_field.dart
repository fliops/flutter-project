import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController myController;
  final String? Function(String?) valid;
  final bool obscureText; // قم بتعيين القيمة الافتراضية لـ obscureText

  const CustomTextField({
    Key? key,
    this.hintText,
    required this.myController,
    required this.valid,
    this.obscureText = false,  // قم بتعيين القيمة الافتراضية لـ obscureText لتكون false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: myController,
        validator: valid,
        obscureText: obscureText, // استخدم قيمة obscureText المعطاة في البناء
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: const Color(0xFFE3F1FC),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFE3F1FC),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

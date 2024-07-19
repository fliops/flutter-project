import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitleEmail extends StatelessWidget {
  TitleEmail({
    super.key,
    required this.titleEmail,
    required TextEditingController mycontroller,
  });
  String titleEmail;
  @override
  Widget build(BuildContext context) {
    return Text(
      titleEmail,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 19,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        height: 0,
      ),
    );
  }
}

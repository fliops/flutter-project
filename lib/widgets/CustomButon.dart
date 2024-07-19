import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButon extends StatelessWidget {
  CustomButon({super.key, required this.text, this.onPressed, this.onTap});
  String text;
  VoidCallback? onPressed;
  VoidCallback? onTap; //MaterialButtonمش بتاخد

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          width: 360,
          height: 62,
          decoration: ShapeDecoration(
            color: const Color(0xFF247ABF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Ad extends StatelessWidget {
  const Ad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 300,
      decoration: const BoxDecoration(
        
        image: DecorationImage(
          image: AssetImage('assets/Group 26.png',),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

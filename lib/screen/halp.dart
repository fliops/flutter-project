import 'package:flutter/material.dart';

class Halp extends StatelessWidget {
  const Halp({Key? key}) : super(key: key);
  static String id = 'Halp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        backgroundColor: const Color(0xFF247ABF),
        title: const Text(
          'Halp',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            height: 0,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the rshttk',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

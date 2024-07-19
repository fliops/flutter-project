import 'package:flutter/material.dart';

class Addres extends StatelessWidget {
  const Addres({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 210,
        height: 35,
        decoration: BoxDecoration(
          color: const Color(0xFFE3F1FC),
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Positioned(
          child: Padding(
            padding: EdgeInsets.only(left: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.blue,
                  size: 24.0,
                ),
                SizedBox(width: 8),
                Text(
                  '41-Shubra, Cairo',
                  style: TextStyle(
                    color: Color(0xFF247ABF),
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

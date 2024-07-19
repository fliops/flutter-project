import 'package:flutter/material.dart';

class Ads extends StatelessWidget {
  const Ads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 370,
            height: 184,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 340,
                    height: 170,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFE3F1FC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 15,
                  top: 12,
                  child: SizedBox(
                    //خاص بكلم و المساحات
                    width: 167.39,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Order Medicine \n',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text:
                                '\nUpload Prescription and tell us what you need.\nWe do the rest\n',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Save Upto 60% off',
                            style: TextStyle(
                              color: Color(0xFF247ABF),
                              fontSize: 13,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  //صورة
                  left: 255,
                  top: 12,
                  child: Container(
                    width: 105.48,
                    height: 153.83,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Picsart.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 17,
                  top: 122,
                  child: SizedBox(
                    width: 103,
                    height: 42,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 103,
                            height: 34,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF247ABF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 14,
                          top: 8,
                          child: SizedBox(
                            width: 84,
                            height: 34,
                            child: Text(
                              'Order Now',
                              style: TextStyle(
                                color: Color(0xFFFFFEFF),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

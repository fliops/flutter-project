import 'package:flutter/material.dart';

class CardOrderUesr extends StatelessWidget {
  VoidCallback? ontap;
  final String title;
  final String content;
  CardOrderUesr(
      {super.key,
      required this.ontap,
      required this.title,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: ListTile(
                isThreeLine: true,
                title: Text(
                  'Full Name :$title ',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address : $content ',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Delivery is in Progress...",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

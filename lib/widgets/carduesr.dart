import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  final VoidCallback? ontap;
  final String email;
  final String username;

  const CardUser({
    Key? key,
    required this.ontap,
    required this.email,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        color: const Color(0xffe3f1fc), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                "assets/family_grandfather 1.png",
                width: 100,
                height: 100,
              ),
            ),
            Expanded(
              flex: 1,
              child: ListTile(
                isThreeLine: true,
                title: Text(
                  'Email  :$email  ',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "User Name : $username ",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

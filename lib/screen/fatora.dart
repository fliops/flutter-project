import 'package:flutter/material.dart';
import 'package:rshttk/model/nav_bar.dart';
import 'package:rshttk/widgets/CustomButon.dart';

class Fatora extends StatefulWidget {
  Fatora({Key? key, required this.productName, required this.lastName})
      : super(key: key);
  String productName;
  String lastName;
  @override
  State<Fatora> createState() => _FatoraState();
}

class _FatoraState extends State<Fatora> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          'Fatora',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            height: 0,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'Full Name : ${widget.productName}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(
              'Address : ${widget.lastName}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const ListTile(
            title: Text(
              'Payment Method : Cash On Delivery',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          CustomButon(
            text: 'Home',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const Normal(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

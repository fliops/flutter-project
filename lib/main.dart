import 'package:flutter/material.dart';
import 'package:rshttk/model/nav_bar.dart';
import 'package:rshttk/screen/HomePharmacy.dart';
import 'package:rshttk/screen/LoginPharmacy.dart';
import 'package:rshttk/screen/halp.dart';
import 'package:rshttk/screen/home%20double.dart';
import 'package:rshttk/screen/login.dart';
import 'package:rshttk/screen/prescription.dart';
import 'package:rshttk/screen/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const Rshttk());
}

class Rshttk extends StatelessWidget {
  const Rshttk({Key? key}) : super(key: key);
  final arg = String;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          sharedPref.getString("id") == null ? "login" : "homeuesr",

      routes: {
        "login": (context) => const LoginPage(),
        "signup": (context) => const RegisterPage(),
        "homeuesr": (context) => const Normal(),
        Halp.id: (context) => const Halp(),
        "prescription": (context) => const Prescription(),
        "homepharmacy": (context) => const HomePharmacy(),
        "loginpharmacy": (context) => const LoginPharmacy(),
        "homeroshttk": (context) => const Home(),
      },
    );
  }
}

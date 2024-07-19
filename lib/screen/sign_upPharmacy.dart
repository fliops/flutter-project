import 'package:flutter/material.dart';
import 'package:rshttk/auth/crud.dart';
import 'package:rshttk/auth/link_api.dart';
import 'package:rshttk/auth/valid.dart';
import 'package:rshttk/screen/login.dart';
import 'package:rshttk/widgets/CustomButon.dart';
import 'package:rshttk/widgets/castmar_text_field.dart';
import 'package:rshttk/widgets/title_emil.dart';

class RegisterPharmacy extends StatefulWidget {
  const RegisterPharmacy({super.key});

  @override
  State<RegisterPharmacy> createState() => _RegisterPharmacyState();
}

class _RegisterPharmacyState extends State<RegisterPharmacy> with Crud{
  @override
  final Formkey = GlobalKey<FormState>();
  final Crud _crud = Crud();
  TextEditingController ph_name = TextEditingController();
  TextEditingController ph_email = TextEditingController();
  TextEditingController ph_password = TextEditingController();
  TextEditingController ph_address = TextEditingController();

  signUp() async {
    if (Formkey.currentState!.validate()) {
      var response = await _crud.postRequest(linkSignUpPharmacy, {
        "ph_name":ph_name.text,
        "ph_email": ph_email.text,
        "ph_password": ph_password.text,
        "ph_address": ph_address.text
      });
      if (response['status'] == "success") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>  const LoginPage()));
      } else {
        print("signUp Fail");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: Formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 5), //bt5ml padding lkol page
          child: ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(height: 20), //طريق من طريق توسيط العنصر
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    ' Sign Up ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5, left: 90, top: 5),
                    child: Image.asset(
                      'assets/logo.png',
                      height: 100,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TitleEmail(
                      titleEmail: 'Full Name',
                      mycontroller: ph_name,
                    ),
                  ],
                ),
              ),
              CustomTextField(
                  obscureText: false,
                  hintText: 'Full Name',
                  myController: ph_name,
                  valid: (val) {
                    return validInput(val!, 3, 50);
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TitleEmail(
                      titleEmail: 'Phone Number',
                      mycontroller: ph_address,
                    ),
                  ],
                ),
              ),
              CustomTextField(
                  obscureText: false,
                  hintText: 'Phone Number',
                  myController: ph_address,
                  valid: (val) {
                    return validInput(val!, 10, 15);
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TitleEmail(
                      titleEmail: 'Email',
                      mycontroller: ph_email,
                    ),
                  ],
                ),
              ),
              CustomTextField(
                  obscureText: false,
                  hintText: 'Email',
                  myController: ph_email,
                  valid: (val) {
                    return validInput(val!, 3, 50);
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TitleEmail(
                      titleEmail: 'Password',
                      mycontroller: ph_password,
                    ),
                  ],
                ),
              ),
              CustomTextField(
                  obscureText: true,
                  hintText: 'Password',
                  myController: ph_password,
                  valid: (val) {
                    return validInput(val!, 8, 20);
                  }),
              const SizedBox(height: 20),
              CustomButon(
                // ElevatedButton(
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: const Color(0xff247ABF),
                // ),
                onPressed: () async {
                  await signUp();
                },
                text: 'Sign Up',
              ),
              // ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'already have an account?',
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const LoginPage();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        ' Login ?',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color(0xFF247ABF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rshttk/auth/crud.dart';
import 'package:rshttk/auth/link_api.dart';
import 'package:rshttk/auth/valid.dart';
import 'package:rshttk/model/nav_bar.dart';
import 'package:rshttk/screen/login.dart';
import 'package:rshttk/widgets/CustomButon.dart';
import 'package:rshttk/widgets/castmar_text_field.dart';
import 'package:rshttk/widgets/title_emil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  final Formkey = GlobalKey<FormState>();
  final Crud _crud = Crud();
  TextEditingController username = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signUp() async {
    if (Formkey.currentState!.validate()) {
      var response = await _crud.postRequest(linkSignUp, {
        "username": username.text,
        "phoneNumber": phoneNumber.text,
        "email": email.text,
        "password": password.text
      });
      if (response['status'] == "success") {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const LoginPage()));
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
                      mycontroller: username,
                    ),
                  ],
                ),
              ),
              CustomTextField(
                  obscureText: false,
                  hintText: 'Full Name',
                  myController: username,
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
                      mycontroller: phoneNumber,
                    ),
                  ],
                ),
              ),
              CustomTextField(
                  obscureText: false,
                  hintText: 'Phone Number',
                  myController: phoneNumber,
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
                      mycontroller: email,
                    ),
                  ],
                ),
              ),
              CustomTextField(
                  obscureText: false,
                  hintText: 'Email',
                  myController: email,
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
                      mycontroller: password,
                    ),
                  ],
                ),
              ),
              CustomTextField(
                  obscureText: true,
                  hintText: 'Password',
                  myController: password,
                  valid: (val) {
                    return validInput(val!, 8, 20);
                  }),
              const SizedBox(height: 20),
              CustomButon(
                onPressed: () async {
                  await signUp();
                },
                text: 'Sign Up',
              ),

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

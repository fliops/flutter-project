import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:rshttk/auth/crud.dart';
import 'package:rshttk/auth/link_api.dart';
import 'package:rshttk/auth/valid.dart';
import 'package:rshttk/main.dart';
import 'package:rshttk/screen/HomePharmacy.dart';
import 'package:rshttk/screen/sign_up.dart';
import 'package:rshttk/widgets/CustomButon.dart';

class LoginPharmacy extends StatefulWidget {
  const LoginPharmacy({Key? key}) : super(key: key);

  @override
  State<LoginPharmacy> createState() => _LoginPharmacyState();
}

class _LoginPharmacyState extends State<LoginPharmacy> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Crud crud = Crud();

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      final Map<String, dynamic>? response = await crud.postRequest(
        linkLoginPharmacy,
        {
          "ph_email": emailController.text,
          "ph_password": passwordController.text,
        },
      );

      if (response?['status'] == "success") {
        sharedPref.setString("id", response?['data']?['id']?.toString() ?? '');
        sharedPref.setString("ph_email", response?['data']?['ph_email'] ?? '');

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePharmacy()));
      } else {
        AwesomeDialog(
          context: context,
          title: "Error",
          body: const Padding(
            padding: EdgeInsets.all(20),
            child:
                Text("Error in email and password or account does not exist"),
          ),
        ).show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.bottomCenter,
            image: AssetImage("assets/Group 23.png"),
          ),
        ),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:50),
                    child: Text(
                      'Log in to your Account ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Welcome Back! Select method to log in: ',
                    style: TextStyle(
                      color: Color(0xff808080),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFF9394AF),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    return validInput(value!, 3, 50);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.lock_outline),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFF9394AF),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    return validInput(value!, 4, 20);
                  },
                ),
              ),

              const SizedBox(height: 60),

              CustomButon(
                onPressed: () async {
                  await login();
                },
                text: 'Log in',
              ),
              // const SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const Text("Don't have an account?"),
              //     TextButton(
              //       onPressed: () {
              //         Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const RegisterPage(),
              //           ),
              //         );
              //       },
              //       child: const Text(
              //         'Sign Up',
              //         style: TextStyle(
              //           color: Color(0xFF247ABF),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // Image.asset(
              //   'assets/Group 23.png',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

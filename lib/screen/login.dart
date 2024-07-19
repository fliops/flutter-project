import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:rshttk/auth/crud.dart';
import 'package:rshttk/auth/link_api.dart';
import 'package:rshttk/auth/valid.dart';
import 'package:rshttk/main.dart';
import 'package:rshttk/model/nav_bar.dart';
import 'package:rshttk/screen/sign_up.dart';
import 'package:rshttk/widgets/CustomButon.dart';
import 'package:rshttk/widgets/castmar_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Crud crud = Crud();

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      final Map<String, dynamic>? response = await crud.postRequest(
        linkLogin,
        {
          "email": emailController.text,
          "password": passwordController.text,
        },
      );

      if (response != null && response['status'] == "success") {
        sharedPref.setString("id", response['data']['id'].toString());
        sharedPref.setString("username", response['data']['username']);
        sharedPref.setString("email", response['data']['email']);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Normal()));
      } else {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
          context: context,
          // btnCancel: const Text("Cancel"),
          title: "Error",
          body: const Text(
              "Error in email and password or account does not exist"),
        ).show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(height: 50),
              Image.asset(
                'assets/logo.png',
                height: 250,
              ),
              const Row(
                children: [
                  Text(
                    'Log in ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField(
                myController: emailController,
                hintText: 'Email',
                valid: (value) {
                  return validInput(value!, 3, 50);
                },
              ),
              const SizedBox(height: 20),
              CustomTextField(
                myController: passwordController,
                hintText: 'Password',
                obscureText: true,
                valid: (value) {
                  return validInput(value!, 4, 20);
                },
              ),
              const SizedBox(height: 20),
              CustomButon(
                onPressed: () async {
                  await login();
                },
                text: 'Log in',
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF247ABF),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

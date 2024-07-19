import 'package:flutter/material.dart';
import 'package:rshttk/main.dart';

class Account extends StatelessWidget {
  const Account({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              sharedPref.clear();
              Navigator.of(context).pushReplacementNamed("login");
            },
            icon: const Icon(Icons.exit_to_app,size: 35,),
          ),
        
          // GestureDetector(
          //   onTap: () {
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return  const LoginPage();
          //         },
          //       ),
          //     );
          //   },
          //   child: const Icon(
          //     Icons.account_circle,
          //     color: Colors.black,
          //     size: 40,
          //   ),
          // ),
        ],
      ),
    );
  }
}

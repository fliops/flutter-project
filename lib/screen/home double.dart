import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "loginuesr");
                },
                child: Text('Start Shift Work'),
              ),
              SizedBox(height: 20), // Add some space between buttons
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "loginpharmacy");
                },
                child: Text('Start Shift Work'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

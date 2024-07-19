import 'package:flutter/material.dart';
import 'package:rshttk/auth/crud.dart';
import 'package:rshttk/auth/link_api.dart';
import 'package:rshttk/main.dart';
import 'package:rshttk/widgets/Ad.dart';
import 'package:rshttk/widgets/account.dart';
import 'package:rshttk/widgets/addras.dart';
import 'package:rshttk/widgets/ads.dart';
import 'package:rshttk/widgets/carduesr.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with Crud {
  getNotes() async {
    var response =
        await postRequest(linkViewUesr, {"id": sharedPref.getString("id")});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Stack(
            children: [
              const Addres(),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    FutureBuilder(
                      future: getNotes(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data['status'] == 'fail')
                            return const Padding(
                              padding: EdgeInsets.only(top: 300),
                              child: Center(
                                  child: Text(
                                "No Roshta",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              )),
                            );
                          return ListView.builder(
                            itemCount: snapshot.data['data'].length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, i) {
                              return CardUser(
                                ontap: () {},
                                email: "${snapshot.data['data'][i]['email']}",
                                username:
                                    "${snapshot.data['data'][i]['username']}",
                              );
                            },
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return const Center(
                            child: Text("No data"),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              const Account(),
            ],
          ),
          const Ads(),
          const Ad(),
        ],
      ),
    );
  }
}

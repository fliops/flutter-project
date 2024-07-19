import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rshttk/auth/crud.dart';
import 'package:rshttk/auth/link_api.dart';
import 'package:rshttk/main.dart';
import 'package:rshttk/model/image_model.dart';
import 'package:rshttk/widgets/account.dart';
import 'package:rshttk/widgets/cardorder.dart';
import 'package:rshttk/widgets/cardorderPharmacy.dart';

class HomePharmacy extends StatefulWidget {
  const HomePharmacy({Key? key}) : super(key: key);

  @override
  State<HomePharmacy> createState() => _HomePharmacyState();
}

class _HomePharmacyState extends State<HomePharmacy> with Crud {
  getNotes() async {
    var response =
        await postRequest(linkViewPharmacy, {"id": sharedPref.getString("id")});
    return response;
  }
   

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
          'Rshttk',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            height: 0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: getNotes(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data['response'] == 'fail')
                    return   Padding(
                      padding: EdgeInsets.only(top: 300),
                      child: Center(
                        child: Text(
                          "No Roshta",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    );
                  return ListView.builder(
                    itemCount: snapshot.data['data'].length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return CardOrder(
                        ontap: () {},
                        notemodel:
                            ImageModel.fromJson(snapshot.data['data'][i]),
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
            const Account(),
          ],
        ),
      ),
    );
  }
}

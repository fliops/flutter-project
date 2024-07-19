import 'package:flutter/material.dart';
import 'package:rshttk/auth/crud.dart';
import 'package:rshttk/auth/link_api.dart';
import 'package:rshttk/main.dart';
import 'package:rshttk/widgets/cardorder.dart';

class Tracking extends StatefulWidget {
  const Tracking({
    Key? key,
    /* required this.productName, required this.lastName*/
  }) : super(key: key);
  // String productName;
  // String lastName;
  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> with Crud {
  getNotes() async {
    var response =
        await postRequest(linkViewNotes, {"id": sharedPref.getString("id")});
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
          'Tracking',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
            height: 0,
          ),
        ),
      ),
      body: Container(
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
                            fontSize: 30, fontWeight: FontWeight.normal),
                      )),
                    );
                  return ListView.builder(
                    itemCount: snapshot.data['data'].length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return CardOrderUesr(
                        ontap: () {},
                        title: "${snapshot.data['data'][i]['title']}",
                        content: "${snapshot.data['data'][i]['content']}",
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
    );
  }
}

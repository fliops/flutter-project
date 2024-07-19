import 'package:flutter/material.dart';
import 'package:rshttk/auth/link_api.dart';
import 'package:rshttk/model/image_model.dart';

class CardOrder extends StatefulWidget {
  VoidCallback? ontap;
  final ImageModel notemodel;
  CardOrder(
      {super.key,
      required this.ontap,
      required this.notemodel});

  @override
  State<CardOrder> createState() => _CardOrderState();
}

late Color currentColor;
bool hasColorChanged = false;

class _CardOrderState extends State<CardOrder> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      //عند الضغط علي الصورة يعرض الصورة
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Image.network(
                "$linkImageRoot/${widget.notemodel.notesImage}",
                width: 1000,
                height: 1000,
                fit: BoxFit.fill,
              ),
            );
          },
        );
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: InteractiveViewer(
                  child: Image.network(
                    "$linkImageRoot/${widget.notemodel.notesImage}",
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                )),
            Expanded(
              flex: 2,
              child: ListTile(
                isThreeLine: true,
                title: Text(
                  'Full Name :${widget.notemodel.notesTitle} ',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle:  Text(
                  "Address: ${widget.notemodel.notesContent}",
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (!hasColorChanged) {
                  Navigator.pushNamed(context, "test");
                  setState(() {
                    currentColor = const Color(0xffccfac4);
                  });
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xffccfac4), // لون الخلفية 
                ),
              ),
              child: const Text('ACCEPT'),
            ),
          ],
        ),
      ),
    );
  }
}

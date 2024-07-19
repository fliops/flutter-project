import 'package:flutter/material.dart';
import 'package:rshttk/auth/crud.dart';
import 'package:rshttk/auth/link_api.dart';
import 'package:rshttk/auth/valid.dart';
import 'package:rshttk/main.dart';
import 'package:rshttk/screen/home%20double.dart';
import 'package:rshttk/widgets/CustomButon.dart';
import 'package:rshttk/widgets/castmar_text_field.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> with Crud {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController title = TextEditingController(text: "");
  TextEditingController content = TextEditingController(text: "");
  TextEditingController ph = TextEditingController(text: "");
  TextEditingController dlv = TextEditingController(text: "");

  addNotes() async {
    // if (myfile == null)
    //   return AwesomeDialog(
    //       context: context,
    //       title: "Error",
    //       body: const Padding(
    //         padding: EdgeInsets.all(8.0),
    //         child: Text("Failed to Add Add. Please try again."),
    //       ))
    //     ..show();
    if (formstate.currentState!.validate()) {
      var response = await postRequest(
        linkAddNotes,
        {
          "ph_name": title.text,
          "ph_addres": content.text,
          "ph_id": ph.text,
          "dlv_id": dlv.text,
          "id": sharedPref.getString("id"),
        },
      );
      if (response?['status'] == "success") {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Home();
        }));
      } else {
        //
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'Add',
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
        child: Form(
          key: formstate,
          child: ListView(
            children: [
              CustomTextField(
                hintText: 'First name',
                myController: title,
                valid: (value) {
                  return validInput(value!, 3, 50);
                },
              ),
              const SizedBox(height: 15),
              CustomTextField(
                myController: content,
                hintText: 'Last Name ',
                valid: (value) {
                  return validInput(value!, 3, 50);
                },
              ),
              const SizedBox(height: 15),
              CustomTextField(
                myController: ph,
                hintText: 'ph',
                valid: (value) {
                  return validInput(value!, 1, 50);
                },
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 15),
              const SizedBox(height: 15),
              CustomTextField(
                myController: dlv,
                hintText: 'dlv',
                valid: (value) {
                  return validInput(value!, 1, 50);
                },
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 15),
              const SizedBox(height: 15),
              // InkWell(
              //   onTap: () {
              //     // عرض واجهة المستخدم لاختيار الصورة من المعرض أو الكاميرا
              //     showModalBottomSheet(
              //       context: context,
              //       builder: (context) => SizedBox(
              //         height: 200,
              //         child: Column(
              //           children: [
              //             const Padding(
              //               padding: EdgeInsets.all(8.0),
              //               child: Text(
              //                 'Please Choose Image',
              //                 style: TextStyle(
              //                   fontSize: 25,
              //                 ),
              //               ),
              //             ),
              //             InkWell(
              //               onTap: () async {
              //                 XFile? xfile = await ImagePicker()
              //                     .pickImage(source: ImageSource.gallery);
              //                 if (xfile != null) {
              //                   myfile = File(xfile.path);
              //                   setState(() {});
              //                 }

              //                 setState(() {});

              //                 Navigator.of(context)
              //                     .pop(); // إخفاء واجهة المستخدم
              //               },
              //               child: Container(
              //                 alignment: Alignment.center,
              //                 width: double.infinity,
              //                 child: const Padding(
              //                   padding: EdgeInsets.all(10),
              //                   child: Text(
              //                     " Image From Gallery",
              //                     style: TextStyle(fontSize: 20),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             InkWell(
              //               onTap: () async {
              //                 // استدعاء كاميرا الجهاز لالتقاط صورة
              //                 XFile? xfile = await ImagePicker()
              //                     .pickImage(source: ImageSource.camera);
              //                 myfile = File(xfile!.path);
              //                 setState(() {});
              //                 Navigator.of(context).pop();
              //               },
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Container(
              //                   alignment: Alignment.center,
              //                   width: double.infinity,
              //                   child: const Padding(
              //                     padding: EdgeInsets.all(10),
              //                     child: Text(
              //                       " Image From Camera",
              //                       style: TextStyle(fontSize: 20),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //         ],
              //       ),
              //     ),
              //   );
              // },
              // child: Container(
              //   height: 80,
              //   width: 290,
              //   decoration: ShapeDecoration(
              //     color: myfile == null
              //         ? const Color(0xff227abf)
              //         : const Color(0xff007c00),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(15),
              //     ),
              //   ),
              // child: const Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              // Padding(
              //   padding: EdgeInsets.all(10),
              //   child: Text(
              //     'Upload  your Add ',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 24,
              //       fontFamily: 'Inter',
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
              //             Icon(
              //               Icons.camera_alt_outlined,
              //               size: 30,
              //               color: Colors.white,
              //             )
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(height: 15),
              CustomButon(
                onPressed: () async {
                  await addNotes();
                },
                text: 'Order New',
              ),
              // SizedBox(
              //   width: 600,
              //   height: 380,
              // // child: myfile != null
              //     ? Image.file(
              //         myfile!,
              //         width: 300,
              //         height: 200,
              //       )
              // : const SizedBox(),
              //         ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:persons_lost/screens/from_edite.dart';
import 'package:persons_lost/widgets/text_app.dart';
import '../widgets/colors_app.dart';
import 'button.dart';

class NeedCreat extends StatefulWidget {
  NeedCreat({super.key});

  @override
  State<NeedCreat> createState() => _NeedCreatState();
}

class _NeedCreatState extends State<NeedCreat> {
  TextEditingController? name = TextEditingController();
  TextEditingController? date = TextEditingController();
  TextEditingController? notes = TextEditingController();
  dynamic db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    //TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFF439A97),
      appBar: AppBar(
        backgroundColor: Color(0xFF439A97),
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFF439A97),
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(top: 40),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 10)),
                Creattextform(
                    hint: NameButton.nameneeds,
                    width: 400,
                    height: 60,
                    controller: name),
                const SizedBox(height: 30),
                Creattextform(
                    hint: NameButton.datefind,
                    width: 400,
                    height: 60,
                    controller: date),
                const SizedBox(height: 30),
                Creattextform(
                    hint: NameButton.notes,
                    width: 400,
                    height: 200,
                    controller: notes),
                const SizedBox(height: 50),
                CreateButton(
                    text: NameButton.postbutton,
                    width: 150,
                    height: 60,
                    onPressed: () {
                      db.collection("needtable").add({
                        "name": name!.text,
                        "date": date!.text,
                        "notes": notes!.text,
                      }).then((DocumentReference doc) =>
                          print('DocumentSnapshot added with ID: ${doc.id}'));
                    },
                    color: ColorSelect.button_co)
              ],
            )),
      ),
    );
  }
}

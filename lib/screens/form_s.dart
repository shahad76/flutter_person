import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persons_lost/screens/button.dart';
import 'package:persons_lost/widgets/text_app.dart';
import '../widgets/colors_app.dart';
import 'from_edite.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
//import 'package:persons_lost/fierbase/modle/add_image.dart';

class Creatform extends StatefulWidget {
  const Creatform({super.key});
  @override
  State<Creatform> createState() => _CreatformState();
}

class _CreatformState extends State<Creatform> {
  String? lang;

  //FirebaseStorage _storage = FirebaseStorage.instance;

  TextEditingController? name = TextEditingController();
  TextEditingController? age = TextEditingController();
  TextEditingController? phonenumber = TextEditingController();
  TextEditingController? city = TextEditingController();
  TextEditingController? dateTime = TextEditingController();
  TextEditingController? gender = TextEditingController();
  // DatabaseReference ref = FirebaseDatabase.instance.ref('personalinformation');
  dynamic db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSelect.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorSelect.primary,
        title: const Text(NameButton.titleBar),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 10)),
              Creattextform(
                  hint: NameButton.personname,
                  width: 400,
                  height: 60,
                  controller: name),
              const SizedBox(height: 10),
              Creattextform(
                  hint: NameButton.age,
                  width: 400,
                  height: 60,
                  controller: age),
              const SizedBox(height: 10),
              Creattextform(
                  hint: NameButton.phonenumer,
                  width: 400,
                  height: 60,
                  controller: phonenumber),
              const SizedBox(height: 10),
              Creattextform(
                  hint: NameButton.cityname,
                  width: 400,
                  height: 60,
                  controller: city),
              const SizedBox(height: 10),
              Creattextform(
                hint: NameButton.datelost,
                width: 400,
                height: 60,
                controller: dateTime,
              ),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                const Text(
                  NameButton.namemale,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Radio(
                  activeColor: ColorSelect.button_co,
                  value: 'ذكر',
                  groupValue: lang,
                  onChanged: (_) {},
                ),
                Row(
                  children: [
                    const Text(NameButton.namefemal,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        )),
                    Radio(
                        fillColor:
                            MaterialStateProperty.all(ColorSelect.button_co),
                        activeColor: ColorSelect.button_co,
                        value: 'انثى',
                        groupValue: lang,
                        onChanged: (_) {}),
                  ],
                ),
              ]),
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CreateButton(
                    text: NameButton.addImage,
                    width: 200,
                    height: 100,
                    onPressed: () {
                      uploadPic();
                    },
                    color: ColorSelect.button_co,
                  ),
                  const SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CreateButton(
                        text: NameButton.postbutton,
                        width: 90,
                        height: 60,
                        onPressed: () {
                          // Add a new document with a generated ID
                          db.collection("information").add({
                            "name": name!.text,
                            "age": age!.text,
                            "phonenumber": phonenumber!.text,
                            "city": city!.text,
                            "dateTime": 'ggg',
                            "gender": "ytrf"
                          }).then((DocumentReference doc) => print(
                              'DocumentSnapshot added with ID: ${doc.id}'));
                        },
                        color: ColorSelect.button_co,
                      ),
                      CreateButton(
                        text: NameButton.editbutton,
                        width: 90,
                        height: 60,
                        onPressed: () {},
                        color: ColorSelect.button_co,
                      )
                    ],
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

Future<Uri> uploadPic() async {
  //Get the file from the image picker and store it
  
  XFile? image = await ImagePicker.pickImage(source: ImageSource.gallery);
  // //Create a reference to the location you want to upload to in firebase
  Reference reference = _storage.ref().child("images/");

  //Upload the file to firebase
  UploadTask uploadTask = reference.putFile(file);
  //// Waits till the file is uploaded then stores the download url
  Uri location = (await uploadTask.future).downloadUrl;
  //returns the download url
  return location;
}

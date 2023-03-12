import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:persons_lost/widgets/colors_app.dart';
import 'package:persons_lost/widgets/original_button.dart';
import 'package:persons_lost/widgets/size_app.dart';
import 'package:persons_lost/widgets/text_app.dart';
import 'package:persons_lost/widgets/usersign.dart';
import '../fierbase/service/read_data.dart';
import '../screens/check_list.dart';
import '../screens/form_s.dart';
import '../screens/from_edite.dart';
import '../screens/tapbar_form.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthForm extends StatefulWidget {
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    TextEditingController? emailAddress = TextEditingController();
    TextEditingController? password = TextEditingController();

    //UserCredential userCredential;
    return Column(
      children: [
        Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                Creattextform(
                    hint: "البريد ألالكتروني",
                    width: 400,
                    height: 60,
                    controller: emailAddress),
                const SizedBox(height: 10),
                Creattextform(
                  hint: "كلمة السر",
                  width: 400,
                  height: 60,
                  controller: password,
                ),
                const SizedBox(height: 30),
                OraginalButton(
                    text: NameButton.login,
                    Textcolor: Colors.white,
                    bgcolor: ColorSelect.primary,
                    onPressed: () async {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: 'shahadsalih@gmail.com',
                          password: 'shahd123',
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                      Get.to(() => check_list());
                    }
                   ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => TabBarDemo());
                    },
                    child: const Text(NameButton.accept,
                        style: TextStyle(
                          fontSize: 25,
                          fontStyle: FontStyle.normal,
                          color: Color(0xFF439A97),
                        )))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

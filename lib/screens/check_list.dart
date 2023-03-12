import 'dart:developer';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:persons_lost/screens/form_needs.dart';
import 'package:persons_lost/screens/form_s.dart';
import 'package:persons_lost/widgets/colors_app.dart';
import 'package:persons_lost/widgets/text_app.dart';
import 'button.dart';

class check_list extends StatefulWidget {
  const check_list({super.key});
  @override
  State<check_list> createState() => _check_listtState();
}

class _check_listtState extends State<check_list> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.all(25),
      color: Color(0xFF439A97),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CreateButton(
            text: NameButton.persons,
            width: 250,
            height: 100,
            onPressed: () {
              Get.to(() => Creatform());

              // Navigator.of(context).pushNamed("info");
            },
            color: ColorSelect.button_co,
          ),
          SizedBox(height: 50),
          CreateButton(
            text: NameButton.needs,
            width: 250,
            height: 100,
            onPressed: () {
              Get.to(() => NeedCreat());
            },
            color: ColorSelect.button_co,
          ),
        ],
      ),
    );
  }
}

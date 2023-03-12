import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../modle/infor_need.dart';

class ReadData extends StatefulWidget {
  const ReadData({super.key});

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  List<Tableneed> users = [];
  // List<Product> productsList = [];
  CollectionReference usersf =
      FirebaseFirestore.instance.collection("needtable");

  getData() async {
    var responsedody = await usersf.get();

    responsedody.docs.forEach((element) {
      var jsonDataOfString =
          jsonEncode(element.data()); // convert data to String
      setState(() {
        users.add(Tableneed.fromJson(
            jsonDecode(jsonDataOfString))); //convert data to Map
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, i) {
              return Container(
                child: Column(
                  children: [
                    Text(users[i].name),
                    Text(users[i].date.toString()),
                    Text(users[i].notes.toString()),
                  ],
                ),
              );
            }));
  }
}

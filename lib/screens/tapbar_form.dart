import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persons_lost/fierbase/modle/user.dart';
import 'package:persons_lost/widgets/colors_app.dart';
import 'package:persons_lost/widgets/text_app.dart';
import '../fierbase/service/read_data.dart';
import '../fierbase/service/read_data_need.dart';

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({super.key});

  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color.fromARGB(255, 35, 83, 228),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: ColorSelect.primary,
            bottom: const TabBar(
              tabs: [
                Tab(
                    icon: Text(
                  NameButton.neeeded,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                )),
                Tab(
                    icon: Text(NameButton.personse,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700))),
              ],
            ),
            title: const Text(NameButton.leaflets,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          ),
          body: TabBarView(
            children: [ReadData(), ReadDataFirebase()],
          ),
        ),
      ),
    );
  }
}

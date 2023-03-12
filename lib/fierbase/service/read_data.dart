import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../modle/persons_information.dart';

class ReadDataFirebase extends StatefulWidget {
  const ReadDataFirebase({super.key});

  @override
  State<ReadDataFirebase> createState() => _ReadDataFirebaseState();
}

class _ReadDataFirebaseState extends State<ReadDataFirebase> {
  List<PersonsInformation> users = [];
  // List<Product> productsList = [];
  CollectionReference usersf =
      FirebaseFirestore.instance.collection("information");
  // void gett() async {
  //   String url =
  //       ('https://testfirebase-e7b6d-default-rtdb.firebaseio.com/product.json');
  //   try {
  //     http.Response res = await http.get(Uri.parse(url));
  //     final extractData = json.decode(res.body) as Map<String, dynamic>;
  //     extractData.forEach((productId, productData) {
  //       productsList.add(Product(
  //         id: productId,
  //         title: productData['title'],
  //         description: productData['description'],
  //         price: productData['price'],
  //         imageUrl: productData['imageUrl'],
  //       ));

  //       setState(() {
  //         productsList;
  //       });
  //     });
  //   } catch (e) {}
  // }

  //  id: json['id'],
  //       name: json['name'],
  //       age: json['age'],
  //       city: json['city'],
  //       phonenumer: json['phonenumer'],
  //       date: json['date'],
  //       gender: json['gender'],

  getData() async {
    var responsedody = await usersf.get();

    responsedody.docs.forEach((element) {
      var jsonDataOfString =
          jsonEncode(element.data()); // convert data to String
      setState(() {
        users.add(PersonsInformation.fromJson(
            jsonDecode(jsonDataOfString))); //convert data to Map
      });
    });
  }

  // void inistate() {
  //   getData();
  //   super.initState();
  // }
  //@override
  // void initState() {
  //  getData();
  //   super.initState();
  // }

  // void inistate() {
  //   // gett();
  //   // super.initState();

  //   Provider.of<Products>(context, listen: false).fetchData();
  // }

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
                    Text(users[i].age),
                    Text(users[i].dateTime),
                    Text(users[i].phonenumber),
                    Text(users[i].city),
                    Text(users[i].gender),
                  ],
                ),
              );
            }));
  }
}

         
//           //عرض محتويات الجدول
//         // .map(
//         //     (snapshot) => //وظيفة الماب المرور عبر الجدول وتخزن كل عنصر داخل المتغير سناب شوت
//         //         snapshot.docs
//         //             .map((doc) => PersonsInformation.fromJson(doc.data()))
//                     // .toList());
// //دالة بترجع القيم وتخزنها في البرنامج
// // streemView(BuildContext buildContext) {
// //   return StreamBuilder<List<PersonsInformation>>(
// //       stream: readPersons(),
// //       builder: (buildContext, snapshot) {
// //         if (snapshot.hasError) {
// //           return Text('يوجد خطأ ما${snapshot.error}');
// //         } else if (snapshot.hasData) {
// //           final person = snapshot.data!;
// //           return ListView(
// //             children: person.map(buildPerson).toList(),
// //           );
// //         } else {
// //           return Center(child: CircularProgressIndicator());
// //         }
// //       });
// // }

// // Widget buildPerson(PersonsInformation personsInformation) =>
 
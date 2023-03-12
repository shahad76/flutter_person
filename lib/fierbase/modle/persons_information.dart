import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonsInformation {
  String id;
  final String name;
  final String age;
  final String phonenumber;
  final String city;
  final String dateTime;
  final String gender;

  PersonsInformation(
      {this.id = "",
      required this.name,
      required this.age,
      required this.city,
      required this.phonenumber,
      required this.dateTime,
      required this.gender});
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'city': city,
        'phonenumber': phonenumber,
        'dateTime': dateTime,
        'gender': gender,
      };
  static PersonsInformation fromJson(Map<String, dynamic> json) =>
      PersonsInformation(
        //id: json['id'],
        name: json['name'],
        age: json['age'],
        city: json['city'],
        phonenumber: json["phonenumber"],
        dateTime: json['dateTime'],
        gender: json['gender'],
      );
}

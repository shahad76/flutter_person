import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tableneed {
  String id;
  final String name;
  final String date;
  final String notes;
  

  Tableneed(
      {this.id = "",
      required this.name,
      required this.date,
      required this.notes});
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
         'date': date,
         'notes':notes,
        
      };
  static Tableneed fromJson(Map<String, dynamic> json) =>
      Tableneed(
        //id: json['id'],
        name: json['name'],
        date: json['date'],
         notes: json['notes'],
        
      );
}

import 'package:flutter/material.dart';

class User {
  String homeCountry;
  dynamic admin;

  User(this.homeCountry, this.admin);

  Map<String, dynamic> toJson() => {
        homeCountry: 'homeCountry',
        admin: 'admin',
      };
}

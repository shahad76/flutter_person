import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:persons_lost/screens/check_list.dart';
import 'package:persons_lost/screens/form_s.dart';
import 'package:persons_lost/screens/intro_screen.dart';
import 'package:persons_lost/screens/login.dart';
import 'package:persons_lost/screens/form_needs.dart';
import 'package:firebase_core/firebase_core.dart';

//import 'package:persons_lost/screens/tapbar_form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user != null) {
      print(user.uid);
    }
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF4A41F5), width: 3),
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
      ),

      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
      //go to bage log in
      routes: {
        "login": (context) => const Login_screen(),
        "list": (context) => const check_list(),
        // "form_u": (context) => const form_s(),
        //"need_mune":(context)=>const form_needs() ,
      },
    );
  }
}

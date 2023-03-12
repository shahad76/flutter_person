import 'package:flutter/material.dart';
import 'package:persons_lost/widgets/auth_form.dart';
import 'package:persons_lost/widgets/colors_app.dart';

class Login_screen extends StatelessWidget {
  const Login_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(
                      color: Color(0xFF439A97),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      )),
                ),
                Column(
                  children: [
                    Image.asset('assets/images/wel2.png'),
                  ],
                ),
              ],
            ),
            AuthForm(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:persons_lost/widgets/colors_app.dart';
import 'package:persons_lost/widgets/original_button.dart';
import '../widgets/text_app.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSelect.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(),
              Image.asset(
                'assets/images/logo2.png',
              ),
              OraginalButton(
                text: NameButton.start,
                onPressed: () => Navigator.of(context).pushNamed("login"),
                Textcolor: ColorSelect.primary,
                bgcolor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

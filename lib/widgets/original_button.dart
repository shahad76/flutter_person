import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OraginalButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color Textcolor;
  final Color bgcolor;

  const OraginalButton({
    Key? key,
    required this.text,
    required this.Textcolor,
    required this.bgcolor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: bgcolor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        onPressed: () => onPressed(),
        child: Text(
          text,
          style: TextStyle(
              color: Textcolor, fontSize: 30, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:persons_lost/widgets/colors_app.dart';
import 'form_needs.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.color,
    required this.onPressed,
  });
  final String text;
  final double width;
  final double height;
  final Function() onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            side: BorderSide(width: 3, color: color),
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: ColorSelect.color_text,
          ),
        ),
      ),
    );
  }
}

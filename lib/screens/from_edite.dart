import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../widgets/colors_app.dart';

class Creattextform extends StatelessWidget {
  const Creattextform({
    super.key,
    required this.hint,
    required this.width,
    required this.height,
    this.controller,
  });
  final String hint;
  final double width;
  final double height;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextFormField(
        controller: controller,
        maxLines: height ~/ 20,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorSelect.primary, width: 1.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorSelect.primary, width: 3.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: ColorSelect.primary)),
          isDense: true,
          hintText: hint,
          hintStyle: TextStyle(color: ColorSelect.color_text),
          filled: true,
          fillColor: ColorSelect.color_textfiled,
        ),
      ),
    );
  }
}

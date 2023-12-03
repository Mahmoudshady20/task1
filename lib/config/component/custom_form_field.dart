// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?)?;

class CustomFormField extends StatelessWidget {
  final String label;
  final String? hint;
  final IconButton? suffix;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType textInputType;
  final int lines;
  final MyValidator validator;
  const CustomFormField(
      {super.key, required this.label,
        this.hint,
        this.isPassword = false,
        required this.controller,
        this.suffix,
        this.textInputType = TextInputType.text,
        this.lines = 1,
        required this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(
        horizontal: 30
      ),
      child: TextFormField(
        style: TextStyle(
          color: Colors.black
        ),
        /**
         * if You tapped outside , then close the Keyboard .
         */
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        obscureText: isPassword,
        controller: controller,
        keyboardType: textInputType,
        minLines: lines,
        maxLines: lines,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              // fontSize: 15
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color:  Color(0xFF07313E),
            )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color:  Color(0xFF07313E),
              ),
          ),
          labelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 15),
          labelText: label,
          suffixIcon: suffix,
        ),
      ),
    );
  }
}
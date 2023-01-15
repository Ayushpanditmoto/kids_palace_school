import 'package:flutter/material.dart';

class TextEnterArea extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function(String)? onFiledSubmitted;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;

  const TextEnterArea(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      this.prefixIcon,
      this.onChanged,
      this.obscureText = false,
      this.keyboardType,
      this.onFiledSubmitted,
      this.validator,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
          color: const Color.fromARGB(87, 134, 134, 134),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          onChanged: onChanged,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          onFieldSubmitted: onFiledSubmitted,
          controller: controller,
          decoration: InputDecoration(
            labelStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            border: InputBorder.none,
            hintText: hintText,
            labelText: labelText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.all(10),
          ),
        ),
      ),
    );
  }
}

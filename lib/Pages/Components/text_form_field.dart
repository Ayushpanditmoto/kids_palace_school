import 'package:flutter/material.dart';

class TextEnterArea extends StatelessWidget {
  final String hintText;
  final String labelText;

  const TextEnterArea(
      {super.key, required this.hintText, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            labelStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            border: InputBorder.none,
            hintText: hintText,
            labelText: labelText,
            contentPadding: const EdgeInsets.all(10),
          ),
        ),
      ),
    );
  }
}

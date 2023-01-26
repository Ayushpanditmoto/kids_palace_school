import 'package:flutter/material.dart';

void snackBarWidget(BuildContext context, String message,
    {Color backgroundColor = Colors.red}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: backgroundColor,
    duration: const Duration(seconds: 3),
  ));
}

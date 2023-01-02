// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  String? title;
  String? image;

  HomeCard({super.key, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Image(
                height: 150,
                image: AssetImage(image!),
              ),
            ),
            const Divider(
              height: 6,
              thickness: 0,
              color: Colors.transparent,
            ),
            Text(title!),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

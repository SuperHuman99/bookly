import 'package:flutter/material.dart';

class CenteredText extends StatelessWidget {
  const CenteredText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontStyle: FontStyle.italic),
      ),
    );
  }
}

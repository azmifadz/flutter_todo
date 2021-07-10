import 'package:flutter/material.dart';

class TdlFormTitleText extends StatelessWidget {
  const TdlFormTitleText({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.subtitle1!.merge(
            TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold),
          ),
    );
  }
}

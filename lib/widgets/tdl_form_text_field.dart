import 'package:flutter/material.dart';

class TdlFormTextField extends StatelessWidget {
  const TdlFormTextField(
      {required this.hintText,
      required this.onTextChanged,
      this.initialValue,
      Key? key})
      : super(key: key);

  final String hintText;
  final Function(String) onTextChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(0),
          ),
        ),
        hintText: hintText,
      ),
      maxLines: 5,
      onChanged: (value) {
        onTextChanged(value);
      },
      initialValue: initialValue,
    );
  }
}

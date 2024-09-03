import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String Label;
  final String HintText;
  final TextEditingController controller;
  const MyTextField(
      {super.key,
      required this.HintText,
      required this.controller,
        required this.Label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Label,
          style: const TextStyle(color: Colors.grey),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.teal, width: 2)),
            hintText: HintText,
          ),
        ),
      ],
    );
  }
}
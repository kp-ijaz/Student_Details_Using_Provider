// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CommonTextForm extends StatelessWidget {
  const CommonTextForm(
      {Key? key,
      required this.title,
      this.typekeyboard = false,
      required this.controllertype,
      required this.validation});
  final String title;
  final bool typekeyboard;
  final controllertype;
  final validation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: typekeyboard ? TextInputType.number : TextInputType.name,
      style: const TextStyle(color: Colors.white),
      controller: controllertype,
      validator: validation,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(204, 255, 255, 255)),
        ),
        labelText: title,
        labelStyle: const TextStyle(color: Colors.white),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
      ),
    );
  }
}

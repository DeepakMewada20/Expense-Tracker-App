import 'package:flutter/material.dart';

class Titalfiled extends StatelessWidget {
  const Titalfiled({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: 50,
      decoration: const InputDecoration(
        // label: Text("Tital"),
        labelText: "Tital",
      ),
    );
  }
}

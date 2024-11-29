import 'package:flutter/material.dart';
import 'package:expense_tracker_app/widgets/expences.dart';

void main() {
  runApp(
     MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Expences(),
    ),
  );
}

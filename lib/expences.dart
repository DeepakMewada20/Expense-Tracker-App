import 'package:flutter/material.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});
  @override
  State<Expences> createState() {
    return _ExpencesState();
  }
}

class _ExpencesState extends State<Expences> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('Top bar'),
          Text('expences'),
        ],
      ),
    );
  }
}

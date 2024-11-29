import 'package:expense_tracker_app/widgets/expences-list/daily_expences_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/modal/expence.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});
  @override
  State<Expences> createState() {
    return _ExpencesState();
  }
}

final List<Expence> _regularExpenses = [
  Expence(
      tital: 'flutter cource',
      prise: 444.4,
      date: DateTime.now(),
      category: Category.work),
  Expence(
      tital: 'movie',
      prise: 50,
      date: DateTime.now(),
      category: Category.leisure),
  Expence(
      tital: 'ladhak',
      prise: 500,
      date: DateTime.now(),
      category: Category.travel),
];

class _ExpencesState extends State<Expences> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter ExpenceTrecar"), 
        actions: [
          IconButton(
            onPressed: () {},
            color: Colors.black,
            iconSize: 30,
            icon: const Icon(Icons.add),
          ),
          //IconButton(onPressed: (){}, icon:const Icon(Icons.accessibility_new),)
        ],
      ),
      body: Column(
        children: [
          const Text(
            'Top bar',
          ),
          Expanded(
            child: DailyExpencesList(expencesList: _regularExpenses),
          ),
        ],
      ),
    );
  }
}

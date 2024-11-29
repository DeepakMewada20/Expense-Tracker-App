import 'package:expense_tracker_app/widgets/expences-list/expence_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/modal/expence.dart';

class DailyExpencesList extends StatelessWidget {
  const DailyExpencesList({super.key, required this.expencesList});
  final List<Expence> expencesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expencesList.length,
      itemBuilder: (ctx, index) => ExpenceItem(expencesList[index]),
    );
  }
}

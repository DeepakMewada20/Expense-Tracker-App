import 'package:flutter/material.dart';
import 'package:expense_tracker_app/modal/expence.dart';

class ExpenceItem extends StatelessWidget {
  const ExpenceItem(
    this.oneExpence, {
    super.key,
  });
  //hear i use oneExpence hare of expence
  final Expence oneExpence;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              oneExpence.tital,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('\$${oneExpence.prise.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcon[oneExpence.category]),
                    const SizedBox(width: 8),
                    Text(oneExpence.formattedDate.toString()),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

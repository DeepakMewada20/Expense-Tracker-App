import 'package:expense_tracker_app/widgets/expences-list/expence_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/modal/expence.dart';

class DailyExpencesList extends StatelessWidget {
  const DailyExpencesList(
      {super.key, required this.expencesList, required this.onRemoveExpence});
  final List<Expence> expencesList;
  final void Function(Expence expence) onRemoveExpence;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expencesList.length,
      itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) => onRemoveExpence(expencesList[index]),
          background: Container(
            color: Theme.of(context).colorScheme.error.withAlpha(15).withOpacity(0.20),
            //margin:EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal,vertical: Theme.of(context).cardTheme.margin!.vertical),
            margin: Theme.of(context).cardTheme.margin,
          ),
          key: ValueKey(expencesList[index]),
          child: ExpenceItem(expencesList[index])),
    );
  }
}

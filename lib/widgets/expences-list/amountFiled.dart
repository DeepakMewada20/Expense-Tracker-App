import 'package:flutter/material.dart';
import 'package:expense_tracker_app/modal/expence.dart';

class Amountfiled {
  static Widget amountFiled({required TextEditingController controller}) {
    return Expanded(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          prefixText: '\$ ',
          labelText: 'Amount',
        ),
        //onChanged: (value) => onAmoundChange(),
      ),
    );
  }

  static Widget datePecker(
      {required DateTime? selectedDate,
      required void Function() presentDatePeker}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            selectedDate == null
                ? 'Select Date'
                : formatter.format(selectedDate),
          ),
          IconButton(
            onPressed: presentDatePeker,
            icon: const Icon(Icons.calendar_month),
          ),
        ],
      ),
    );
  }

  static Widget dropDownButten(
      {required Category selectdCategory,
      required void Function(Category) selectDropdownItam}) {
    return DropdownButton(
      value: selectdCategory,
      items: Category.values
          .map(
            (category) => DropdownMenuItem(
              value: category,
              child: Text(
                category.name.toUpperCase(),
              ),
            ),
          )
          .toList(),
      onChanged: (value) {
        selectDropdownItam(value!);
      },
    );
  }
}

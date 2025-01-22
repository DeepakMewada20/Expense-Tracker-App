import 'package:flutter/material.dart';

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
}

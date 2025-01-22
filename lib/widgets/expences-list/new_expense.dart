import 'package:expense_tracker_app/widgets/expences-list/amountFiled.dart';
import 'package:expense_tracker_app/widgets/expences-list/titalFiled.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/modal/expence.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpence});
  final void Function(Expence) onAddExpence;
  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titalController = TextEditingController();
  final _amountController = TextEditingController();
  //String _amount = "";
  DateTime? _selectedDate;
  Category _selectdCategory = Category.food;

  @override
  void dispose() {
    _titalController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePeker() async {
    final currentDate = DateTime.now();
    final firstDate =
        DateTime(currentDate.year - 5, currentDate.month, currentDate.day);
    final lastDate = currentDate;

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submmitExpenseData() {
    final enteredamount = double.tryParse(_amountController.text);
    bool amountIsInvalid = enteredamount == null || enteredamount <= 0;
    if (_titalController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invelid Input"),
          content: const Text(
              "Please make sure a valid tital, amount, Date, and category was entered"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okey"),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAddExpence(
      Expence(
          tital: _titalController.text,
          prise: enteredamount,
          date: _selectedDate!,
          category: _selectdCategory),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final keybordSpace = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, keybordSpace + 16),
          child: Column(
            children: [
              // TextField(
              //   controller: _titalController,
              //   maxLength: 50,
              //   decoration: const InputDecoration(
              //     // label: Text("Tital"),
              //     labelText: "Tital",
              //   ),
              //   style: const TextStyle(
              //     color: Colors.white, // Text color
              //   ),
              // ),
              Titalfiled(controller: _titalController),
              Row(
                children: [
                  // Expanded(
                  //   child: TextField(
                  //     controller: _amountController,
                  //     keyboardType: TextInputType.number,
                  //     decoration: const InputDecoration(
                  //       prefixText: '\$ ',
                  //       labelText: 'Amount',
                  //     ),
                  //   ),
                  // ),
                  Amountfiled.amountFiled(
                      controller: _amountController,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _selectedDate == null
                              ? 'Select Date'
                              : formatter.format(_selectedDate!),
                        ),
                        IconButton(
                          onPressed: _presentDatePeker,
                          icon: const Icon(Icons.calendar_month),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  DropdownButton(
                    value: _selectdCategory,
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
                      setState(() {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectdCategory = value;
                        });
                      });
                    },
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Censal"),
                  ),
                  ElevatedButton(
                      onPressed: _submmitExpenseData,
                      child: const Text("Save Expense"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:expense_tracker_app/modal/expence.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titalController = TextEditingController();
  final _amountController = TextEditingController();
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
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titalController,
            maxLength: 50,
            decoration: const InputDecoration(
              // label: Text("Tital"),
              labelText: "Tital",
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(
              //     Radius.circular(5),
              //   ),
              // ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    labelText: 'Amount',
                  ),
                ),
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
    );
  }
}

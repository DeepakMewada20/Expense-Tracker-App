import 'package:expense_tracker_app/widgets/expences-list/input_filed_for_new_expense.dart';
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

  void _selectDropdownItam(Category? value) {
    setState(() {
      if (value == null) {
        return;
      }
      setState(() {
        _selectdCategory = value;
      });
    });
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
              Titalfiled(controller: _titalController),
              Row(
                children: [
                  Inputfiled.amountFiled(
                    controller: _amountController,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Inputfiled.datePecker(
                      selectedDate: _selectedDate,
                      presentDatePeker: _presentDatePeker),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  // DropdownButton(
                  //   value: _selectdCategory,
                  //   items: Category.values
                  //       .map(
                  //         (category) => DropdownMenuItem(
                  //           value: category,
                  //           child: Text(
                  //             category.name.toUpperCase(),
                  //           ),
                  //         ),
                  //       )
                  //       .toList(),
                  //   onChanged: (value) {
                  //     setState(() {
                  //       if (value == null) {
                  //         return;
                  //       }
                  //       setState(() {
                  //         _selectdCategory = value;
                  //       });
                  //     });
                  //   },
                  // ),
                  Inputfiled.dropDownButten(
                      selectdCategory: _selectdCategory,
                      selectDropdownItam: _selectDropdownItam),
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

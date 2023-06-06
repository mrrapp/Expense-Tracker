import 'package:flutter/material.dart';

import '../models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // creating controller
  final _titleInputController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.general;

  // you need to dispose to clear memory which if not done can crash app
  @override
  void dispose() {
    _titleInputController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 5, now.month, now.day);
    final lastDate = DateTime.now();
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);
    setState(() {
      // since selected date is empty, picked date assigns selcted date values
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    // getting amount as double and not as string
    final enteredAmount = double.tryParse(
      _amountController
          .text, // if it gets a string it will throw null as string can't be coverted to double
    );
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    // conditions to show and error message
    if (_titleInputController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      // error message
      showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Text('Invalid Input'),
            content:
                const Text('Please make sure title, amount and date are valid'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Okay'))
            ],
          );
        }),
      );
      return; // so that the codes below won't run if the entered details are invalid
    }
    widget.onAddExpense(
      Expense(
        title: _titleInputController.text,
        amount: enteredAmount,
        category: _selectedCategory,
        date: _selectedDate!,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(children: [
        // Text field
        TextField(
          autofocus: true,
          controller: _titleInputController,
          keyboardType: TextInputType.name,
          maxLength: 20,
          decoration: const InputDecoration(
            label: Text('Expense Title'),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                autofocus: true,
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefix: Text(
                    '\$ ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  label: Text('Amount'),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Selected date
                  Text(
                    _selectedDate == null
                        ? 'No Date Selected '
                        : formatter.format(_selectedDate!),
                  ),
                  IconButton(
                    onPressed: _datePicker,
                    icon: const Icon(
                      Icons.calendar_month,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            // drop down menu
            DropdownButton(
                value: _selectedCategory,
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
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                }),
            const Spacer(),
            ElevatedButton(
              onPressed: _submitExpenseData,
              child: const Text('submit'),
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      ]),
    );
  }
}

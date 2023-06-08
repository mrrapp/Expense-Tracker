import 'package:flutter/material.dart';
import 'package:my_expenses/widgets/expenses-list/expenses_list.dart';
import 'package:my_expenses/models/expense.dart';
import 'package:my_expenses/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Mango',
      amount: 120.23,
      category: Category.food,
      date: DateTime.now(),
    ),
    Expense(
      title: 'Man',
      amount: 20.23,
      category: Category.work,
      date: DateTime.now(),
    ),
    Expense(
      title: 'ango',
      amount: 120.23,
      category: Category.general,
      date: DateTime.now(),
    ),
    Expense(
      title: 'go',
      amount: 120.23,
      category: Category.travel,
      date: DateTime.now(),
    ),
    Expense(
      title: 'Man on fire',
      amount: 120.23,
      category: Category.leisure,
      date: DateTime.now(),
    ),
    Expense(
      title: 'Mango',
      amount: 120.23,
      category: Category.food,
      date: DateTime.now(),
    ),
    Expense(
      title: 'Mango',
      amount: 120.23,
      category: Category.food,
      date: DateTime.now(),
    ),
  ];

  // making a function that makes users add expenses to the UI
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  // Remove expense function
  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses
        .indexOf(expense); //getting the index of all expenses in list
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context)
        .clearSnackBars(); // to clear snackbar on multiple removal
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label:
              'Undo', // undo needs to rebuild UI to add deleted expense to list
          onPressed: () {
            setState(() {
              // using insert to return deleted list back to former position
              _registeredExpenses.insert(
                expenseIndex,
                expense,
              );
            });
          },
        ),
      ),
    );
  }

  // Making an add expense overlay button
  void _addExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExpense(onAddExpense: _addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found!!!'),
    );
    // making a condition for showing no expenses found if expense list is empty
    if (_registeredExpenses.isNotEmpty) {
      // uisng return threw a weird screen
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expense Tracker'),
        actions: [
          IconButton(
            onPressed:
                _addExpenseOverlay, // added as a pointer to the method and not directly as the method, bcos desire is not to get executed here imediately but only when button is pressed
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Graph
          const Text(
            'Graph',
            style: TextStyle(fontSize: 100),
          ),
          Expanded(child: mainContent)
        ],
      ),
    );
  }
}

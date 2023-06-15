import 'package:flutter/material.dart';
import 'package:my_expenses/models/expense.dart';
import 'package:my_expenses/widgets/expenses-list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        
        background: Container(
          margin: Theme.of(context).cardTheme.margin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        onDismissed: ((direction) => onRemoveExpense(
              expenses[index],
            )),
        key: ValueKey(expenses[index]),
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}

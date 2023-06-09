import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

// enums are pre defined values
enum Category { food, leisure, travel, work, general }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.work: Icons.work,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.general: Icons.abc
};

class Expense {
  // Which kind of data should be grouped in a single expense?
  Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  }) : id = uuid.v4(); //class constructors
// the last part is an intialiser list
  final String id;
  final double amount;
  final String title;
  final DateTime date; // DateTime comes from dart
  final Category category; // the Category type comes from the enum above

  //formatting date and time with a method or getter
  String get formattedDate {
    return formatter.format(date);
  }
}

// Graph
class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  // creating an extra constructor function that filters categories
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();
// the above adds logic to the class expense bucket

  // Expense bucket sums all intems in category and puts them in one bar
  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    // using a for loop to sum all expenses
    for (final expense in expenses) {
      sum = sum + expense.amount;
    }

    return sum;
  }
}

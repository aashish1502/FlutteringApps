import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();
final formatter = DateFormat.yMd();

class Expense {
  Expense({required this.title,
    required this.amount,
    required this.date,
    required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }


}

enum Category { food, travel, work, leisure }

const categoryIcons = {
  Category.food: Icons.fastfood_rounded,
  Category.work: Icons.work_rounded,
  Category.leisure: Icons.movie_creation,
  Category.travel: Icons.local_taxi_rounded
};


class ExpenseBucket {

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses.where((element) => element.category == category)
      .toList();

  const ExpenseBucket({required this.category, required this.expenses});

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (Expense expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
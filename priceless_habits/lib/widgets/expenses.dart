import 'package:flutter/material.dart';
import 'package:priceless_habits/widgets/expense_list/expenses_list.dart';
import 'package:priceless_habits/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Flutter",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Vodka Cranberry",
        amount: 10.0,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Sandwich",
        amount: 8.00,
        date: DateTime(2023, 9, 7, 17, 30),
        category: Category.food),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const Text("The chart"),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}

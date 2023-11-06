import 'package:flutter/material.dart';
import 'package:priceless_habits/models/expense.dart';
import 'package:priceless_habits/widgets/chart/chart.dart';
import 'package:priceless_habits/widgets/expense_list/expenses_list.dart';
import 'package:priceless_habits/widgets/new_expense.dart';

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

  void _openExpenseOverlay() async {
    Expense newExpense = await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => const NewExpense());
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  void removeExpense(Expense expense) {
    final index = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Let the IRS figure that one out"),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
          label: "maybe not?",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(index, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("Tihs is a placeholder"),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        removeExpenseCaller: removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Debt reinvented"),
        actions: [
          IconButton(
              onPressed: _openExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body:
          MediaQuery.of(context).size.width > MediaQuery.of(context).size.height
              ? Row(
                  children: [
                    Expanded(child: Chart(expenses: _registeredExpenses)),
                    Expanded(child: mainContent),
                  ],
                )
              : Column(
                  children: [
                    Expanded(child: Chart(expenses: _registeredExpenses)),
                    Expanded(child: mainContent),
                  ],
                ),
    );
  }
}

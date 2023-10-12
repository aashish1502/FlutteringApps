import 'package:flutter/material.dart';
import 'package:priceless_habits/widgets/expense_list/expense_item.dart';

import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpenseCaller});

  final List<Expense> expenses;
  final void Function(Expense expense) removeExpenseCaller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
            secondaryBackground: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error.withOpacity(.6),
                  borderRadius: BorderRadius.circular(25)),
              margin: EdgeInsets.symmetric(
                  horizontal: Theme.of(context).cardTheme.margin!.horizontal),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // Positioned at the end
                children: [
                  Icon(Icons.delete, color: Colors.white),
                  SizedBox(width: 20),
                ],
              ),
            ),
            background: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error.withOpacity(.6),
                  borderRadius: BorderRadius.circular(25)),
              margin: EdgeInsets.symmetric(
                  horizontal: Theme.of(context).cardTheme.margin!.horizontal),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // Positioned at the start
                children: [
                  SizedBox(width: 20),
                  Icon(Icons.delete, color: Colors.white),
                ],
              ),
            ),
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              removeExpenseCaller(expenses[index]);
            },
            child: ExpenseItem(expenseItem: expenses[index])));
  }
}

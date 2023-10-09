import 'package:flutter/cupertino.dart';
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
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              removeExpenseCaller(expenses[index]);
            },
            child: ExpenseItem(expenseItem: expenses[index])));
  }
}

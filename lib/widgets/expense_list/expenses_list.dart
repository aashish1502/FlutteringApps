import 'package:flutter/cupertino.dart';
import 'package:priceless_habits/widgets/expense_list/expense_item.dart';

import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => ExpenseItem(expenseItem: expenses[index]));
  }
}

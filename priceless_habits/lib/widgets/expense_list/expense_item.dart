import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expenseItem});

  final Expense expenseItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: Column(
            children: [
              Text(expenseItem.title),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text("\$ ${expenseItem.amount.toStringAsFixed(2)}"),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expenseItem.category]),
                      const SizedBox(width: 8),
                      Text(expenseItem.formattedDate),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:priceless_habits/models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleControllor = TextEditingController();
  final _amountControllor = TextEditingController();
  Category _categoryValue = Category.leisure;
  DateTime? _selectedDate = DateTime.now();

  void _submitExpenseDate() {
    final enteredAmout = double.tryParse(_amountControllor.text);
    final isValidAmount = enteredAmout == null || enteredAmout <= 0;

    if (_titleControllor.text
        .trim()
        .isEmpty ||
        isValidAmount ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) =>
              AlertDialog(
                title: const Text("invalid input"),
                content:
                const Text("Please make sure entered fields are valid."),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text("Okay"))
                ],
              ));
      return;
    }

     Navigator.pop(context, Expense(title: _titleControllor.text,
         amount: enteredAmout,
         date: _selectedDate!,
         category: _categoryValue));
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final date = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  void dispose() {
    _amountControllor.dispose();
    _titleControllor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final keyboardPadding = MediaQuery.of(context).viewInsets.bottom;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardPadding + 16),
        child: Column(
          children: [
            TextField(
              controller: _titleControllor,
              maxLength: 64,
              decoration:
              const InputDecoration(label: Text("Title of the expense")),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountControllor,
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                    decoration: const InputDecoration(
                        label: Text("Amount"), prefixText: "\$ "),
                  ),
                ),
                Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _selectedDate == null
                              ? "No Date Selected"
                              : formatter.format(_selectedDate!),
                        ),
                        IconButton(
                            onPressed: _presentDatePicker,
                            icon: const Icon(Icons.calendar_month))
                      ],
                    ))
              ],
            ),
            Row(
              children: [
                DropdownButton(
                    value: _categoryValue,
                    items: Category.values
                        .map((category) =>
                        DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase())))
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _categoryValue = value;
                      });
                    }),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                ElevatedButton(
                    onPressed: _submitExpenseDate,
                    child: const Text("Add expense")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

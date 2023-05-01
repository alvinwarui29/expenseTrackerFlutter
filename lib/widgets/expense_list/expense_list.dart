import 'package:expensetracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'expense_item.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({required this.expenses, required this.onRemove, super.key});
  List<Expense> expenses;
  void Function(Expense expense) onRemove;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: ((direction) => onRemove(expenses[index])),
          child: ExpenseItem(expenses[index])),
    );
  }
}

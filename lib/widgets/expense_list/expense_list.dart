import 'package:expensetracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'expense_item.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({required this.expenses, super.key});
  List<Expense> expenses;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseItem(expenses[index]),
    );
  }
}

import 'package:expensetracker/expense_list.dart';
import 'package:expensetracker/models/expense.dart';
import 'package:flutter/material.dart';

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
        title: 'Fare',
        amount: 23.11,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: 'Food',
        amount: 12,
        date: DateTime.now(),
        category: Category.Food),
  ];
  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Chart section'),
          Expanded(child: ExpenseList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}

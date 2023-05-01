import 'package:expensetracker/widgets/expense_list/expense_list.dart';
import 'package:expensetracker/models/expense.dart';
import 'package:expensetracker/widgets/new_expense.dart';
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
        category: Categoryy.travel),
    Expense(
        title: 'Food',
        amount: 12,
        date: DateTime.now(),
        category: Categoryy.Food),
  ];

  void _addExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 5),
        content: Text('Expense deleted'),
        action: SnackBarAction(
            label: 'undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: _addExpenseOverlay, icon: const Icon(Icons.add_box))
        ],
        title: const Text('Expense Tracker'),
      ),
      body: Column(
        children: [
          const Text('Chart section'),
          Expanded(
              child: ExpenseList(
            expenses: _registeredExpenses,
            onRemove: _removeExpense,
          )),
        ],
      ),
    );
  }
}

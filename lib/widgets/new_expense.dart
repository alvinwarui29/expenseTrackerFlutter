import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expensetracker/models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Categoryy _selectedCategoty = Categoryy.Food;
  DateTime? _selectedDate;
  void _presentDayPicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitFormData() {
    Navigator.pop(context);
    final _enteredAmount = double.tryParse(_amountController.text);
    final _amountIsInvalid = _enteredAmount == null || _enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        _amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: const Text('Invalid input'),
                content: const Text('Please fill in the right data'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('okay'))
                ],
              )));
      return;
    }
    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: _enteredAmount,
        date: _selectedDate!,
        category: _selectedCategoty));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
        child: Column(children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(label: Text('Enter amount')),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate == null
                      ? 'no Date selected'
                      : formatter.format(_selectedDate!)),
                  IconButton(
                    onPressed: _presentDayPicker,
                    icon: const Icon(Icons.calendar_month),
                  )
                ],
              ))
            ],
          ),
          Expanded(
            child: Row(
              children: [
                DropdownButton(
                    value: _selectedCategoty,
                    items: Categoryy.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedCategoty = value;
                      });
                    }),
                const Spacer(),
                ElevatedButton(
                    onPressed: _submitFormData,
                    child: const Text('Save expense')),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')),
              ],
            ),
          )
        ]));
  }
}

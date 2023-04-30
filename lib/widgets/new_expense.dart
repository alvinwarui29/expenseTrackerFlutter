import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            controller: _amountController,
            maxLength: 10,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(label: Text('Enter amount')),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(_titleController);
                    print(_amountController);
                  },
                  child: const Text('Save expense')),
              const Spacer(),
              TextButton(onPressed: () {}, child: const Text('Cancel')),
            ],
          )
        ],
      ),
    );
  }
}

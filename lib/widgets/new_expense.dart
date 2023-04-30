import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

var titleInput = '';
void _setTitle(String input) {
  titleInput = input;
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          const TextField(
            onChanged: _setTitle,
            maxLength: 50,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              label: Text('Title'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                print(titleInput);
              },
              child: const Text('Save expense'))
        ],
      ),
    );
  }
}

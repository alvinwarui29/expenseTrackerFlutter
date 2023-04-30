import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { Food, leisure, travel, work }

const categoryIcons = {
  Category.Food: Icons.dinner_dining_outlined,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff_outlined,
  Category.work: Icons.work
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}

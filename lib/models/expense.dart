import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Categoryy { Food, leisure, travel, work }

const categoryIcons = {
  Categoryy.Food: Icons.dinner_dining_outlined,
  Categoryy.leisure: Icons.movie,
  Categoryy.travel: Icons.flight_takeoff_outlined,
  Categoryy.work: Icons.work
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
  final Categoryy category;

  String get formattedDate {
    return formatter.format(date);
  }
}

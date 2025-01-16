import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category { food, work, travel, leisure }

const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class Expence {
  Expence(
      {required this.tital,
      required this.prise,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String tital;
  final double prise;
  final Enum category;
  final DateTime date;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expences});

  ExpenseBucket.forCategory(List<Expence> allExpences, this.category)
      : expences = allExpences
            .where((expence) => expence.category == category)
            .toList();

  final Category category;
  final List<Expence> expences;

  double get totalExpence {
    double sum = 0;
    for (final expence in expences) {
      sum += expence.prise;
    }
    return sum;
  }
}

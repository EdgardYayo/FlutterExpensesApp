import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {

  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(title: 'Flutter Course', amount: 19.99, date: DateTime.now(), category: Category.work),
    Expense(title: 'Travel to Japan', amount: 500.50, date: DateTime.now(), category: Category.travel),
    Expense(title: 'New MacOs', amount: 1000.89, date: DateTime.now(), category: Category.leisure),
  ];
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('The chart'),
          Text('Expenses list....')
        ],
      ),
    );
  }
}
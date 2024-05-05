import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/new_expense.dart';
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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(context: context, builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Flutter Expense Tracker', 
          style: TextStyle(color: Colors.white)
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            hoverColor: Colors.white,
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add, color: Colors.purple,)
          )
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(child: ExpensesList(expenses: _registerExpenses))
        ],
      ),
    );
  }
}
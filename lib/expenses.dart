import 'package:expense_tracker/chart/chart.dart';
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
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context, 
      builder: (ctx) => NewExpense(onAddExpense: _addExpense)
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registerExpenses.indexOf(expense);

    setState(() {
      _registerExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        duration: const Duration(seconds: 2),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo', 
          onPressed: () {
            setState(() {
              _registerExpenses.insert(
                expenseIndex, expense
              );
            });
          }
        ),
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registerExpenses.isNotEmpty) {
      mainContent = ExpensesList(
            expenses: _registerExpenses,
            onRemoveExpense: _removeExpense,
      );
    }

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
      body: width < 600 ? Column(
        children: [
          Chart(expenses: _registerExpenses),
          Expanded(child: mainContent),
        ],
      ) : Row(children: [
          Expanded(child: 
            Chart(expenses: _registerExpenses)
          ),
          Expanded(child: mainContent),
      ]),
    );
  }
}
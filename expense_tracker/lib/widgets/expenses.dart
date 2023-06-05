import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import 'expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StateExpenses();
  }
}

class _StateExpenses extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense('Flutter Course', 19.99, DateTime(2023, 6, 1), Category.work),
    Expense('Cinema', 9.99, DateTime(2023, 4, 1), Category.leisure),
    Expense('Store', 79.99, DateTime(2023, 1, 23), Category.food),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: false,
        context: context,
        builder: (ctx) {
          return NewExpense(
            onAddExpense: _addExpense,
          );
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Expense \'${expense.title}\' deleted.'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () => setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              })),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;

    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseOverlay,
          ),
        ],
      ),
      body: width < 600 //check rolate
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.topCenter,
                        child: Chart(expenses: _registeredExpenses))),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}

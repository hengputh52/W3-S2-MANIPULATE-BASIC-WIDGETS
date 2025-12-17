import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expense_form.dart';
import 'expense_item.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _expenses = [
    // Expense(
    //   title: 'Flutter Course',
    //   amount: 19.99,
    //   date: DateTime.now(),
    //   category: Category.work,
    // ),
    // Expense(
    //   title: 'Cinema',
    //   amount: 15.69,
    //   date: DateTime.now(),
    //   category: Category.leisure,
    // ),
  ];

  void onAddClicked(BuildContext context)  {
    showModalBottomSheet<Expense>(
      isScrollControlled: false,
      context: context,
      builder: (c) => Center(child: ExpenseForm(callback: (Expense expense)
      {
        setState(() {
          _expenses.add(expense);
        });
      }
        )
      ),
    );

    // TODO YOUR CODE HERE
  }
    void _removeExpense(int index) {
    // Store the removed expense and its index for undo
    final removedExpense = _expenses[index];
    final removedIndex = index;

    setState(() {
      _expenses.removeAt(index);
    });

    // Clear any existing snackbar before showing new one
    ScaffoldMessenger.of(context).clearSnackBars();

    // Show snackbar with undo option
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text('${removedExpense.title} deleted'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              _expenses.insert(removedIndex, removedExpense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {onAddClicked(context)},
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: _expenses.isEmpty
        ? const Center(
            child: Text(
              'No expenses found! Start adding some.',
              style: TextStyle(fontSize: 18),
            ),
          )
        : ListView.builder(
        itemCount: _expenses.length,
        itemBuilder: (context, index) => 
        Dismissible(
          key: ValueKey(_expenses[index]),
          onDismissed: (direction) {
            setState(() {
              _removeExpense(index);
              
            });
            
          },
          child: ExpenseItem(expense: _expenses[index])
          ),
      ),
    );
  }
}


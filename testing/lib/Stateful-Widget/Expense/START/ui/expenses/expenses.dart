import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';


final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

class ExpensesView extends StatefulWidget {
  final List<Expense> expenses ;
  const ExpensesView({super.key ,required this.expenses});

  @override
  State<ExpensesView> createState() {
    return _ExpensesViewState();
  }
}

class _ExpensesViewState extends State<ExpensesView> {



  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.expenses.length,
      itemBuilder: (context, index) => ExpenseItem(expense: widget.expenses[index]),
    );
  }
}

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  const ExpenseItem({super.key, required this.expense});

  IconData get expenseIcon {
    switch (expense.category) {
      case Category.food:
        return Icons.free_breakfast;
      case Category.travel:
        return Icons.travel_explore;
      case Category.leisure:
        return Icons.holiday_village;
      case Category.work:
        return Icons.work;
    }
  }

  String get expenseDate {
    return dateFormat.format(expense.date);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("${expense.amount.toStringAsFixed(2)} \$"),
                ],
              ),
              Spacer(),
              Row(children: [Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(expenseIcon),
              ), Text(expenseDate),
            ],
          ),
        ]
        ),
        
        ),
      ),
    );
  }
}

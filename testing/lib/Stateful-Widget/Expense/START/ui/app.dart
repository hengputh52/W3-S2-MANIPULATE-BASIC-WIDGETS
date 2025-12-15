import 'package:flutter/material.dart';
import 'package:testing/Stateful-Widget/Expense/START/ui/expenses/statisticCard.dart';

import 'expenses/expense_form.dart';
import 'expenses/expenses.dart';
import '../models/expense.dart';


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  
List<Expense> expense = [
      Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
];

  void createNewExpand(Expense ex){
    setState(() {     
      expense.add(
        Expense(title: ex.title, amount: ex.amount, date: ex.date, category: ex.category)
      );
    });
  }

  void onAddClicked(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: false,
      context: context,
      builder: (c) => Center(
        child: ExpenseForm(callback: createNewExpand,),
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
      body: Column(
        children: [  
        StatisticCard(),
        Expanded(child: ExpensesView(expenses: expense)),

        ],
      )
    );
  }
}

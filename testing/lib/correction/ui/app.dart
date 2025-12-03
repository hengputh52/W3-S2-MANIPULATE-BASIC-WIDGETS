import 'package:flutter/material.dart';

import 'expenses/expenses.dart';

class App extends StatelessWidget {
  const App({super.key});

  void onAddClicked(BuildContext context) {
  
    showModalBottomSheet(
      isScrollControlled: false,
      context: context,
      builder: (c) => Center(
        child: Container(
          padding: EdgeInsets.all(30),
          color: Colors.blue,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  label: Text('Title'),
                  
                  border: OutlineInputBorder(),
                  
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  hintText: 'Enter the title', hintStyle: TextStyle(color: Colors.white),
                  
                ),
                maxLength: 60,
              ),
              const Spacer(),
              ElevatedButton(onPressed: ()=> {Navigator.pop(context)}, child: Text("Close me")),
            ],
            

          )
          
          
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
      body: ExpensesView(),
    );
  }
}
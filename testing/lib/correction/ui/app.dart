import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/correction/data/expenseData.dart';
import 'package:testing/correction/models/expense.dart';

import 'expenses/expenses.dart';

class App extends StatelessWidget {

  const App({super.key

  }
  );

  void onAddClicked(BuildContext context)  async{
    Expense? newExpense = await 
  
    showModalBottomSheet<Expense>(
      isScrollControlled: false,
      context: context,
      builder: (c) => Center(
        child: Container(
          padding: EdgeInsets.all(30),
          color: Colors.blue,
          child: NewExpenseCard()
          
          
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



class NewExpenseCard extends StatefulWidget {
    
  const NewExpenseCard({
    super.key,
  

  });

  @override
  State<NewExpenseCard> createState() => _NewExpenseCardState();
}

class _NewExpenseCardState extends State<NewExpenseCard> {
  final expenseTitleController = TextEditingController();
  final priceController = TextEditingController();
  

  void onCancel()
  {
    Navigator.pop(context);
  }
  
  void onCreated()
  {
  
    String title = expenseTitleController.text;
    double price = double.parse(priceController.text);
    setState(() {
      expenses.add(
        Expense(title: title, amount:  price, date: DateTime.now(), category: Category.food)
      );
    Navigator.pop(context);

    });
    
  }
  @override
  void dispose()
  {
    expenseTitleController.dispose();
    priceController.dispose();
    super.dispose();
  }


 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: expenseTitleController,
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
        TextFormField(
          
          controller: priceController,
          
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            label: Text('Price'),
            prefix: Text('\$ '),
            border: OutlineInputBorder(),
            
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
            ),
            hintText: 'Enter number of price', hintStyle: TextStyle(color: Colors.white),
            
          ),
          maxLength: 60,
        
        ),


        //Text('Value is $newText'),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            
        ElevatedButton(onPressed: onCancel, child: Text("Close me")),
        ElevatedButton(onPressed: onCreated, child: Text("Create")),
          ],
        )
      ],
      
    
    );
  }
}
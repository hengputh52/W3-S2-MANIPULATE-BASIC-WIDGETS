import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  final void Function(Expense expense) callback;
  const ExpenseForm({super.key,required this.callback});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
 
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.food;
  DateTime _selectDate = DateTime.now();

  @override
  void dispose(){
    super.dispose();

    _titleController.dispose();
  }

  void onCreate() {
    //  1 Build an expense
    String  title = _titleController.text;
    double amount = double.parse(_amountController.text);             // for now..
    

    // ignore: unused_local_variable
    Expense newExpense = Expense(title: title, amount: amount, date: _selectDate, category: _selectedCategory);
    widget.callback(newExpense);

    Navigator.pop(context);

    // TODO YOUR CODE HERE
  }
  
  void onCancel() {
   
    // Close the modal
    Navigator.pop(context);
  }

  void onDatePicker() async
  {
    final pickedDate =  await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
      initialDate: _selectDate
      );

    if(pickedDate != null)
    {
      setState(() {
        _selectDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(label: const Text("Title")),
            maxLength: 50,
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                controller: _amountController,
                decoration: InputDecoration(label: const Text('amount')),
                ),
              ),
              IconButton(
                onPressed: onDatePicker,
                icon: Icon(Icons.date_range)
                )
            ],
          ),
          DropdownButtonFormField<Category>(
            value: _selectedCategory,
            decoration: InputDecoration(label: const Text('choose category')),
            items: Category.values.map((item) => DropdownMenuItem(
              value: item,
              child: Text(item.name)
              )
            ).toList(),
            onChanged: (value) {
              if(value != null)
              {
                setState(() {
                  _selectedCategory = value;
                });
              }
            },
          ),
           ElevatedButton(onPressed: onCancel, child: Text("Cancel")),
           SizedBox(height: 10),
          ElevatedButton(onPressed: onCreate, child: Text("Create")),
        ],
      ),
    );
  }
}

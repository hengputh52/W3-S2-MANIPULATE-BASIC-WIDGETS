import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';
class ExpenseForm extends StatefulWidget {
  final void Function(Expense expense) callback;
  const ExpenseForm({super.key ,required this.callback});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? selectedDate;
  Category? selectedCategory;
  


    Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void cancle() {
    Navigator.pop(context);
  }

  
  void submit() {
    final title = _titleController.text;
    final amountText = _amountController.text;

    if (title.isEmpty || amountText.isEmpty) {
      return;
    }

    final amount = double.tryParse(amountText);
    if (amount == null) {
      return;
    }

    widget.callback(
      Expense(
        title: title,
        amount: amount,
        date: selectedDate!,
        category: selectedCategory!
        
      ),
      
    );
    Navigator.pop(context);

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
           
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              
            ],
            decoration: InputDecoration(
              label: Text("Amount"),
              prefixText: '\$',
              ),
            maxLength: 50,
          ),
          DropdownMenu(
            label: Text('Select Category'),
            onSelected: (Category? category)
            {
              setState(() {
                selectedCategory = category;
              });
            },
            dropdownMenuEntries: Category.values.map((Category category)
            {
              return DropdownMenuEntry<Category>
              (
                value: category,
                label: category.name
              );
              }).toList()
            ),
            
          IconButton(
            onPressed: _selectDate,
            icon: Icon(Icons.calendar_month)
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(onPressed: cancle, child: Text("Cancle")),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10 ,horizontal: 10),
              child: ElevatedButton(onPressed: submit , child: Text("Create"))),
            ]

          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Use DateFormat to format dates when displaying, not when creating DateTime
DateFormat format = DateFormat('dd-MM-yyyy');

class Item {
  final String itemName;
  final double price;
  final IconData category;
  final DateTime date;

  Item({
    required this.itemName,
    required this.price,
    required this.category,
    required this.date,
  });
}

// Fixed: use DateTime() directly, not format.DateTime()
List<Item> items = [
  Item(itemName: 'Grocery', price: 45.50, category: Icons.shopping_cart, date: DateTime(2025, 11, 1)),
  Item(itemName: 'Coffee', price: 5.99, category: Icons.coffee, date: DateTime(2025, 11, 5)),
  Item(itemName: 'Gas', price: 60.00, category: Icons.local_gas_station, date: DateTime(2025, 11, 8)),
  Item(itemName: 'Movie Ticket', price: 12.00, category: Icons.movie, date: DateTime(2025, 11, 10)),
  Item(itemName: 'Restaurant', price: 35.75, category: Icons.restaurant, date: DateTime(2025, 11, 12)),
  Item(itemName: 'Electricity Bill', price: 85.00, category: Icons.bolt, date: DateTime(2025, 11, 15)),
  Item(itemName: 'Internet', price: 49.99, category: Icons.wifi, date: DateTime(2025, 11, 18)),
  Item(itemName: 'Gym Membership', price: 30.00, category: Icons.fitness_center, date: DateTime(2025, 11, 20)),
  Item(itemName: 'Books', price: 22.50, category: Icons.book, date: DateTime(2025, 11, 25)),
  Item(itemName: 'Medicine', price: 15.00, category: Icons.medical_services, date: DateTime(2025, 11, 28)),
];

class ListExpense extends StatelessWidget {
  const ListExpense({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index)
      {
        print('Builidng item ${index + 1}');
      
        return ExpenseItem(item: items[index]);
      },
      );
      //print('item $index');
  
  }
}

class ExpenseItem extends StatelessWidget {
  final Item item;

  const ExpenseItem({
    super.key,
    required this.item
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.blue[50],
          
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.itemName),
                Text('Price: \$${item.price}'),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(item.category),
                const SizedBox(width: 10),
                // Use format.format() to display the date nicely
                Text(format.format(item.date)),
              ],
            )
          ],
        ),
      ),
    );
  }
}



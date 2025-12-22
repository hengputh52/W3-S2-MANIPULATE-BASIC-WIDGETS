import 'package:flutter/material.dart';
import 'package:testing/Category_code/ui/groceries/grocery_form.dart';
import '../../models/grocery.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<Grocery> _groceries = [];

  void onCreate() async {
    final newGrocery = await Navigator.push<Grocery>(
      context,
      MaterialPageRoute(builder: (context) => const NewItem()),
    );

    if (newGrocery != null) {
      setState(() {
        _groceries.add(newGrocery);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (_groceries.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceries.length,
        itemBuilder: (context, index) {
          final grocery = _groceries[index];
          return GroceryTile(grocery: grocery);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: () => onCreate(),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
    // TODO-2 - Display groceries with ListTile
    return ListTile(
      leading: Container(
        width: 24,
        height: 24,
        color: grocery.category.color,
      ),
      title: Text(grocery.name),
      trailing: Text('${grocery.quantity}'),
    );
  }
}


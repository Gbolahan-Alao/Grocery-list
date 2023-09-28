import 'package:flutter/material.dart';
// import 'package:shopping_list/data/dummy_data.dart';
import 'package:shopping_list/models/grocery.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<Grocery> groceryList = [];
  void _addItem() async {
    final newItem = await Navigator.of(context).push<Grocery>(
      MaterialPageRoute(builder: (ctx) => const NewItem()),
    );
    if (newItem == null) {
      return;
    }
    setState(() {
      groceryList.add(newItem);
    });
  }

  void _removeItem(Grocery item) {
    setState(() {
      groceryList.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('Groceries are empty, add new groceries'),
    );
    if (groceryList.isNotEmpty) {
      setState(() {
        content = ListView.builder(
          itemCount: groceryList.length,
          itemBuilder: (ctx, index) => Dismissible(
            key: ValueKey(groceryList[index].id),
            onDismissed:(direction){
               _removeItem(groceryList[index]);
            },
            child: ListTile(
              leading: Container(
                height: 24,
                width: 24,
                decoration:
                    BoxDecoration(color: groceryList[index].category.color),
              ),
              title: Text(groceryList[index].title),
              trailing: Text(groceryList[index].quantity.toString()),
            ),
          ),
        );
      });
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
          actions: [
            IconButton(
              onPressed: _addItem,
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: content);
  }
}

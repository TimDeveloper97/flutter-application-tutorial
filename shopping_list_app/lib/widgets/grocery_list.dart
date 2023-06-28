import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';
import 'package:shopping_list_app/models/grocery_item.dart';
import 'package:shopping_list_app/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];

  Future<List<GroceryItem>> _loadItems() async {
    final url =
        Uri.https('testdatabase-b76ec.firebaseio.com', 'shopping-list.json');
    try {
      final response = await http.get(url);

      if (response.statusCode >= 400) {
        throw Exception(
            'Failed to fetch grocery items. Please try again later.');
      }

      if (response.body == 'null') {
        return [];
      }

      final Map<String, dynamic> listData = json.decode(response.body);
      final List<GroceryItem> loadedItems = [];

      for (var item in listData.entries) {
        final category = categories.entries
            .firstWhere(
                (catItem) => catItem.value.title == item.value["category"])
            .value;

        loadedItems.add(GroceryItem(
            id: item.key,
            name: item.value["name"],
            quantity: item.value["quantity"],
            category: category));
      }

      return loadedItems;
    } catch (e) {
      throw Exception('Failed to fetch grocery items. Please try again later.');
    }
  }

  void _addItem(BuildContext context) async {
    final newItem =
        await Navigator.of(context).push<GroceryItem>(MaterialPageRoute(
      builder: (context) => const NewItem(),
    ));

    if (newItem != null) {
      setState(() {
        _groceryItems.add(newItem);
      });
    }
  }

  void removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https(
        'testdatabase-b76ec.firebaseio.com', 'shopping-list/${item.id}.json');
    final response = await http.delete(url);

    if (response.statusCode != 200) {
      setState(() {
        _groceryItems.insert(index, item);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
              onPressed: () => _addItem(context), icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('There\'re no item yet.'),
            );
          }

          var data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(data[index].id),
                onDismissed: (direction) {
                  removeItem(data[index]);
                },
                child: ListTile(
                  title: Text(data[index].name),
                  leading: Container(
                    width: 24,
                    height: 24,
                    color: data[index].category.color,
                  ),
                  trailing: Text(data[index].quantity.toString()),
                ),
              );
            },
          );
        },
        future: _loadItems(),
      ),
    );
  }
}

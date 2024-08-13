import 'package:flutter/material.dart';

class CategorySelectionScreen extends StatefulWidget {
  final String category;
  final List<String> items;
  final List<String> initiallySelected;

  CategorySelectionScreen({
    required this.category,
    required this.items,
    required this.initiallySelected,
  });

  @override
  _CategorySelectionScreenState createState() =>
      _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  late Set<String> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = widget.initiallySelected.toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sélectionner ${widget.category}'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context, _selectedItems.toList());
            },
          ),
        ],
      ),
      body: ListView(
        children: widget.items.map((item) {
          return CheckboxListTile(
            title: Text(item),
            value: _selectedItems.contains(item),
            onChanged: (bool? selected) {
              setState(() {
                if (selected == true) {
                  _selectedItems.add(item);
                } else {
                  _selectedItems.remove(item);
                }
              });
            },
          );
        }).toList(),
      ),
    );
  }
}

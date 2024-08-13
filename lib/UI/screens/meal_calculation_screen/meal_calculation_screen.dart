import 'package:flutter/material.dart';
import 'package:flutter_codelab/models/user_profile.dart';

class MealCalculationScreen extends StatelessWidget {
  final UserProfile userProfile;
  final Map<String, Set<String>> selectedItems;

  MealCalculationScreen({
    required this.userProfile,
    required this.selectedItems,
  });

  Map<String, Map<String, double>> _calculateQuantities() {
    final quantities = <String, Map<String, double>>{};

    selectedItems.forEach((category, items) {
      final categoryQuantities = <String, double>{};
      for (var item in items) {
        categoryQuantities[item] = (items.length * 50).toDouble();
      }
      if (categoryQuantities.isNotEmpty) {
        quantities[category] = categoryQuantities;
      }
    });

    return quantities;
  }

  @override
  Widget build(BuildContext context) {
    final quantities = _calculateQuantities();

    return Scaffold(
      appBar: AppBar(
        title: Text('Calcul des Quantités'),
      ),
      body: ListView(
        children: quantities.entries.map((categoryEntry) {
          final category = categoryEntry.key;
          final categoryQuantities = categoryEntry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.blue[100],
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                width: double.infinity,
                child: Text(
                  category,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              ...categoryQuantities.entries.map((entry) {
                return ListTile(
                  title: Text(entry.key),
                  trailing: Text('${entry.value.toStringAsFixed(0)} g'),
                );
              }).toList(),
              Divider(),
            ],
          );
        }).toList(),
      ),
    );
  }
}

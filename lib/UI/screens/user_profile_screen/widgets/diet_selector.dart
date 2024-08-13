import 'package:flutter/material.dart';

class DietSelector extends StatelessWidget {
  final Set<String> selectedDiets;
  final Function(String) onDietSelected;

  DietSelector({required this.selectedDiets, required this.onDietSelected});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          _dietOption('Végé', Icons.local_florist),
          _dietOption('Viande', Icons.restaurant),
          _dietOption('Poisson', Icons.outdoor_grill),
          _dietOption('Vegan', Icons.nature),
        ],
      ),
    );
  }

  Widget _dietOption(String diet, IconData icon) {
    bool isSelected = selectedDiets.contains(diet);
    return GestureDetector(
      onTap: () => onDietSelected(diet),
      child: Container(
        width: 150,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
            SizedBox(height: 8),
            Text(
              diet,
              style: TextStyle(
                color: isSelected ? Colors.blue : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

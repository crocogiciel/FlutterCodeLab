import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MealSelector extends StatelessWidget {
  final List<int> selectedMeals;
  final Function(int) onMealSelected;

  MealSelector({required this.selectedMeals, required this.onMealSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _mealIcon('Petit-déjeuner', Icons.breakfast_dining, 1),
        _mealIcon('Déjeuner', Icons.lunch_dining, 2),
        _mealIcon('Dîner', Icons.dinner_dining, 3),
      ],
    );
  }

  Widget _mealIcon(String meal, IconData icon, int mealType) {
    bool isSelected = selectedMeals.contains(mealType);
    return GestureDetector(
      onTap: () => onMealSelected(mealType),
      child: Container(
        width: 100,
        height: 120,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: isSelected ? Colors.green : Colors.grey,
            ),
            SizedBox(height: 8),
            Expanded(
              child: Center(
                child: AutoSizeText(
                  meal,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  minFontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

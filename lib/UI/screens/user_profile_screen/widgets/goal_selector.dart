import 'package:flutter/material.dart';

class GoalSelector extends StatelessWidget {
  final String selectedGoal;
  final Function(String) onGoalSelected;

  GoalSelector({required this.selectedGoal, required this.onGoalSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _goalContainer('Maintien'),
        _goalContainer('Prise de poids'),
        _goalContainer('Perte de poids'),
      ],
    );
  }

  Widget _goalContainer(String goal) {
    bool isSelected = selectedGoal == goal;
    return GestureDetector(
      onTap: () => onGoalSelected(goal),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.blue[50] : Colors.transparent,
        ),
        child: Text(goal, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}

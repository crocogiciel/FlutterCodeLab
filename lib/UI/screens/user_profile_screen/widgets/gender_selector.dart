import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  final String selectedGender;
  final Function(String) onGenderSelected;

  GenderSelector({required this.selectedGender, required this.onGenderSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _genderIcon('Femme', Icons.female, Colors.pink),
        _genderIcon('Homme', Icons.male, Colors.blue),
      ],
    );
  }

  Widget _genderIcon(String gender, IconData icon, Color color) {
    bool isSelected = selectedGender == gender;
    return GestureDetector(
      onTap: () => onGenderSelected(gender),
      child: Column(
        children: [
          Icon(
            icon,
            size: 50,
            color: isSelected ? color : Colors.grey,
          ),
          SizedBox(height: 4),
          Text(gender),
        ],
      ),
    );
  }
}

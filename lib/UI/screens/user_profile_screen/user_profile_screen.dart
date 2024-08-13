import 'package:flutter/material.dart';
import 'package:flutter_codelab/UI/screens/category_selection_screen/ingredients_selection_screen.dart';
import 'package:flutter_codelab/UI/screens/user_profile_screen/widgets/diet_selector.dart';
import 'package:flutter_codelab/UI/screens/user_profile_screen/widgets/gender_selector.dart';
import 'package:flutter_codelab/UI/screens/user_profile_screen/widgets/goal_selector.dart';
import 'package:flutter_codelab/UI/screens/user_profile_screen/widgets/meal_selector.dart';
import 'package:flutter_codelab/UI/widgets/full_width_button.dart';
import 'package:flutter_codelab/models/user_profile.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String _gender = '';
  String _goal = '';
  List<int> _mealsPerDay = [];
  String _diet = 'Végé';
  final Set<String> _selectedDiets = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Utilisateur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Genre',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    GenderSelector(
                      selectedGender: _gender,
                      onGenderSelected: (gender) {
                        setState(() {
                          _gender = _gender == gender ? '' : gender;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    Text('Objectif',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    GoalSelector(
                      selectedGoal: _goal,
                      onGoalSelected: (goal) {
                        setState(() {
                          _goal = _goal == goal ? '' : goal;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    Text('Nombre de repas par jour',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    MealSelector(
                      selectedMeals: _mealsPerDay,
                      onMealSelected: (mealType) {
                        setState(() {
                          if (_mealsPerDay.contains(mealType)) {
                            _mealsPerDay.remove(mealType);
                          } else {
                            _mealsPerDay.add(mealType);
                          }
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Régime alimentaire',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    DietSelector(
                      selectedDiets: _selectedDiets,
                      onDietSelected: (diet) {
                        setState(() {
                          if (_selectedDiets.contains(diet)) {
                            _selectedDiets.remove(diet);
                          } else {
                            _selectedDiets.add(diet);
                          }
                        });
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                )
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FullWidthIconButton(
                text: "Continuer",
                onPressed: () {
                  if (_gender.isNotEmpty &&
                      _goal.isNotEmpty &&
                      _mealsPerDay.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            IngredientsScreen(
                              userProfile: UserProfile(
                                gender: _gender,
                                goal: _goal,
                                mealsPerDay: _mealsPerDay,
                                diet: _diet,
                              ),
                            ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

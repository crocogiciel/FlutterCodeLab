import 'package:flutter/material.dart';
import 'package:flutter_codelab/UI/screens/user_profile_screen/user_profile_screen.dart';

void main() {
  runApp(MealPlannerApp());
}

class MealPlannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UserProfileScreen(),
    );
  }
}
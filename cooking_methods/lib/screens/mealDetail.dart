import 'package:cooking_methods/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({super.key, required this.mealToBeShown});

  final Meal mealToBeShown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealToBeShown.title),
      ),
      body: Image.network(mealToBeShown.imageUrl),
    );
  }
}

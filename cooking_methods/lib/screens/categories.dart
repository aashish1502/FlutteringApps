import 'package:cooking_methods/data/dummyData.dart';
import 'package:cooking_methods/models/category.dart';
import 'package:cooking_methods/screens/meals.dart';
import 'package:cooking_methods/widgets/categoryGridItem.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.onToggleMeal});
  final void Function(Meal meal) onToggleMeal;
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) =>
                MealsScreen(title: category.title, meals: filteredMeals, onToggleFavorite: onToggleMeal,)));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            slectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}

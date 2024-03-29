import 'package:cooking_methods/models/meal.dart';
import 'package:cooking_methods/screens/mealDetail.dart';
import 'package:cooking_methods/widgets/mealItem.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.onToggleFavorite});

  final String? title;
  final List<Meal> meals;
  final Function(Meal meal) onToggleFavorite;

  void _selectMeal(BuildContext context, Meal mealToBeShown) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealDetail(
          mealToBeShown: mealToBeShown,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, idx) => MealItem(
              meal: meals[idx],
              onSelectMeal: () {
                _selectMeal(context, meals[idx]);
              },
            ));

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Uh oh.... nothing here",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            const SizedBox(
              height: 16,
            ),
            Text("Try a different Category",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground))
          ],
        ),
      );
    }

    if (title == null) {
      return Container(child: content);
    } else {
      return Scaffold(
        appBar: AppBar(title: Text(title!)),
        body: Container(child: content),
      );
    }
  }
}

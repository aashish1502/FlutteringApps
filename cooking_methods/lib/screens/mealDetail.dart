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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(mealToBeShown.imageUrl,
                height: 300, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            for (final ingredient in mealToBeShown.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),

            const SizedBox(
              height: 26,
            ),

            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 26,
            ),
            for (final step in mealToBeShown.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

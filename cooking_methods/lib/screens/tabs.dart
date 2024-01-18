import 'package:cooking_methods/screens/categories.dart';
import 'package:cooking_methods/screens/filters.dart';
import 'package:cooking_methods/screens/meals.dart';
import 'package:cooking_methods/widgets/mainDrawer.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  final List<Meal> _favoriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 500),
      ),
    );
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    if (_favoriteMeals.contains(meal)) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage("Meal is no longer favorite favorite");
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage("Meal has been set to favorite");
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filter') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => FilterScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoryScreen(
      onToggleMeal: _toggleMealFavoriteStatus,
    );
    var activeScreenTitle = "Categories";

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activeScreenTitle = "Favorites";
    }

    return Scaffold(
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectPage(index);
        },
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
        ],
      ),
    );
  }
}

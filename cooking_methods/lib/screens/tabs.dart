import 'package:cooking_methods/data/dummyData.dart';
import 'package:cooking_methods/screens/categories.dart';
import 'package:cooking_methods/screens/filters.dart';
import 'package:cooking_methods/screens/meals.dart';
import 'package:cooking_methods/widgets/mainDrawer.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

final kInitialFilters = {
  Filter.vegan: false,
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
};

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
  Map<Filter, bool> _filterMap = {
    Filter.vegan: false,
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
  };

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

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filter') {
      final response = await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (ctx) => FilterScreen(currentFilers: _filterMap,)));
      setState(() {
        _filterMap = response ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    final availableMeals = dummyMeals.where((meal) {
      if (_filterMap[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_filterMap[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_filterMap[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_filterMap[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();


    Widget activePage = CategoryScreen(
      onToggleMeal: _toggleMealFavoriteStatus,
      availableMeals: availableMeals,
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

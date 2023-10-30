import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';

import '../models/meal.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({Key? key}) : super(key: key);

  @override
  _AddMealScreenState createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final _mealNameController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _instructionsController = TextEditingController();
  final _durationController = TextEditingController();

  String? selectedComplexity = Complexity.simple.toString();
  String? selectedAffordability = Affordability.affordable.toString();
  String? selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Meal')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: 'Meal Name'),
                controller: _mealNameController,
                style: const TextStyle(color: Colors.white),
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Ingredients'),
                controller: _ingredientsController,
                style: const TextStyle(color: Colors.white),
                minLines: 6,
                maxLines: 9,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Instructions'),
                controller: _instructionsController,
                style: const TextStyle(color: Colors.white),
                minLines: 6,
                maxLines: 9,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField<String>(
                        value: selectedAffordability,
                        style: const TextStyle(color: Colors.white),
                        items: Affordability.values
                            .map(
                              (value) => DropdownMenuItem<String>(
                                value: value.toString(),
                                child: Text(
                                  value.toString().split('.').last,
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedAffordability = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField<String>(
                        value: selectedComplexity,
                        style: const TextStyle(color: Colors.white),
                        items: Complexity.values
                            .map(
                              (value) => DropdownMenuItem<String>(
                                value: value.toString(),
                                child: Text(
                                  value.toString().split('.').last,
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedComplexity = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                      style: const TextStyle(color: Colors.white),
                      value: availableCategories.first.id,
                      items: availableCategories
                          .map((e) => DropdownMenuItem(
                              value: e.id, child: Text(e.title)))
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedCategory = newValue;
                        });
                      }),
                ),
              ),
              TextFormField(
                controller: _durationController,
                decoration: const InputDecoration(hintText: 'Duration'),
              ),
              TextButton(
                  onPressed: () {
                    dummyMeals.add(Meal(
                        id: 'm$highestMeal',
                        categories: List.from([selectedCategory]),
                        title: _mealNameController.text,
                        imageUrl:
                            'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
                        ingredients: _ingredientsController.text.split(','),
                        steps: _instructionsController.text.split(','),
                        duration: int.parse(_durationController.text),
                        complexity: Complexity.simple,
                        affordability: Affordability.affordable,
                        isGlutenFree: false,
                        isLactoseFree: false,
                        isVegan: false,
                        isVegetarian: false));
                    dummyMeals.forEach((element) {
                      print(element.title);
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../models/category.dart' as model;

const categories = {
  model.Categories.vegetables: model.Category(
    'Vegetables',
    Color.fromARGB(255, 0, 255, 128),
  ),
  model.Categories.fruit: model.Category(
    'Fruit',
    Color.fromARGB(255, 145, 255, 0),
  ),
  model.Categories.meat: model.Category(
    'Meat',
    Color.fromARGB(255, 255, 102, 0),
  ),
  model.Categories.dairy: model.Category(
    'Dairy',
    Color.fromARGB(255, 0, 208, 255),
  ),
  model.Categories.carbs: model.Category(
    'Carbs',
    Color.fromARGB(255, 0, 60, 255),
  ),
  model.Categories.sweets: model.Category(
    'Sweets',
    Color.fromARGB(255, 255, 149, 0),
  ),
  model.Categories.spices: model.Category(
    'Spices',
    Color.fromARGB(255, 255, 187, 0),
  ),
  model.Categories.convenience: model.Category(
    'Convenience',
    Color.fromARGB(255, 191, 0, 255),
  ),
  model.Categories.hygiene: model.Category(
    'Hygiene',
    Color.fromARGB(255, 149, 0, 255),
  ),
  model.Categories.other: model.Category(
    'Other',
    Color.fromARGB(255, 0, 225, 255),
  ),
};

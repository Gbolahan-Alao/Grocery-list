import 'package:shopping_list/models/grocery.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/data/categories.dart';



final groceryItems = [
  Grocery(
      id: 'a',
      title: 'Milk',
      quantity: 1,
      category: categories[Categories.dairy]!),
  Grocery(
      id: 'b',
      title: 'Bananas',
      quantity: 5,
      category: categories[Categories.fruit]!),
  Grocery(
      id: 'c',
      title: 'Beef Steak',
      quantity: 1,
      category: categories[Categories.meat]!),
];
import 'package:shopping_list/models/category.dart';


class Grocery {
  const Grocery(
      {required this.category,
      required this.title,
      required this.id,
      required this.quantity});
  final String title;
  final Category category;
  final int quantity;
  final String id;
}

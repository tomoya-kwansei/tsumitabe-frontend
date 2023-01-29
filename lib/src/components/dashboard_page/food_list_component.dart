import 'package:flutter/material.dart';
import 'package:tsumitabe_frontend/src/models/food.dart';
import 'package:tsumitabe_frontend/src/models/user.dart';

class FoodListComponent extends StatefulWidget {
  final List<Food> foods;
  const FoodListComponent({Key? key, required this.foods}) : super(key: key);

  @override
  _FoodListComponentState createState() => _FoodListComponentState();
}

class _FoodListComponentState extends State<FoodListComponent> {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(6),
      mainAxisSpacing: 4,
      children: widget.foods.map((item) => Image.network(item.url)).toList(),
    );
  }
}

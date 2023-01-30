import 'package:flutter/material.dart';
import 'package:tsumitabe_frontend/src/components/dashboard_page/food_list_component.dart';
import 'package:tsumitabe_frontend/src/components/dashboard_page/tsumitabe_chart_component.dart';
import 'package:tsumitabe_frontend/src/models/food.dart';
import 'package:tsumitabe_frontend/src/models/user.dart';

class DashboardComponent extends StatefulWidget {
  final User user;
  const DashboardComponent({Key? key, required this.user}) : super(key: key);

  @override
  _DashboardComponentState createState() => _DashboardComponentState();
}

class _DashboardComponentState extends State<DashboardComponent> {
  @override
  Widget build(BuildContext context) {
    final foods = List.generate(
        60,
        (index) => Food(
            id: index,
            name: "food No. $index",
            url: "https://picsum.photos/seed/$index/320/320"));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: TsumitabeChartComponent()),
        Expanded(child: FoodListComponent(foods: foods))
      ],
    );
  }
}

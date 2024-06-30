import 'package:flutter/material.dart';
import 'package:flutter_coffee_menu/src/common/widgets/item.dart';

class CoffeeCategory extends StatelessWidget {
  final String title;

  CoffeeCategory({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.7,
          ),
          itemCount: 6, // Количество элементов в категории
          itemBuilder: (context, index) {
            return CoffeeItem();
          },
        ),
      ],
    );
  }
}
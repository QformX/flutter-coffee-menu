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
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
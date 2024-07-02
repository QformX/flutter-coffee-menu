import 'package:flutter/material.dart';

class CoffeeItem extends StatefulWidget {
  @override
  _CoffeeItemState createState() => _CoffeeItemState();
}

class _CoffeeItemState extends State<CoffeeItem> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
              height: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            const Text('Олеато'),
            const SizedBox(height: 8),
            SizedBox(
            height: 48.0, // Устанавливаем фиксированную высоту
            child: _quantity == 0
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _quantity = 1;
                      });
                    },
                    child: const Text('139 руб'),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (_quantity > 1) {
                              _quantity--;
                            } else {
                              _quantity = 0;
                            }
                          });
                        },
                      ),
                      Text('$_quantity'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            if (_quantity < 10) {
                              _quantity++;
                            }
                          });
                        },
                      ),
                    ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
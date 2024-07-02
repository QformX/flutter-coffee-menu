import 'package:flutter/material.dart';

class CoffeeItem extends StatefulWidget {
  final CoffeeItemData itemData;

  CoffeeItem({required this.itemData});

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
              widget.itemData.imageUrl,
              height: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(widget.itemData.name),
            const SizedBox(height: 8),
            SizedBox(
            height: 40.0, // Устанавливаем фиксированную высоту
            child: _quantity == 0
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _quantity = 1;
                      });
                    },
                    child: Text('${widget.itemData.price} руб'),
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

class CoffeeItemData {
  final String imageUrl;
  final String name;
  final int price;

  CoffeeItemData({required this.imageUrl, required this.name, required this.price});
}
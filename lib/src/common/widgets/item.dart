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
      elevation: 0.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(widget.itemData.imageUrl),
              height: 100,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0), 
              child: Text(widget.itemData.name),
              ),
            SizedBox(
              height: 24,
            child: _quantity == 0
                ? ElevatedButton(
                  style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                          (_) {
                              return const Color.fromARGB(199, 63, 4, 4);
                          }
                        ),
                      ),
                    onPressed: () {
                      setState(() {
                        _quantity = 1;
                      });
                    },
                    child: Text(
                      textAlign: TextAlign.center,
                      '${widget.itemData.price} руб',
                      style: const TextStyle(
                          color: Colors.white,

                        ),
                      ),
                  )
                : Container(
                  margin: EdgeInsets.zero,
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(199, 63, 4, 4)
                            ),
                        child: IconButton(
                        highlightColor: const Color.fromARGB(0, 255, 255, 255),
                        style: Theme.of(context).iconButtonTheme.style,
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
                      ),
                      SizedBox(
                        width: 30,
                        child: Text('$_quantity', textAlign: TextAlign.center),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(199, 63, 4, 4)
                            ),
                        child: IconButton(
                        highlightColor: const Color.fromARGB(0, 255, 255, 255),
                        style: Theme.of(context).iconButtonTheme.style,
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            if (_quantity < 10) {
                              _quantity++;
                            }
                          });
                        },
                      ),
                      ),
                    ],
                  )
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
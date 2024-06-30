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
              'https://sun9-25.userapi.com/s/v1/ig2/k0Cv-yYsOKsysRRN0hXt0mnoLsuc3B_yiIlbOf6cNOtAqJ2nAFG56yd4PbdApD7qr5ZiJUDcKOMMoomNulpHONU9.jpg?size=200x200&quality=96&crop=0,134,531,531&ava=1',
              height: 100,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 8),
            Text('Олеато'),
            SizedBox(height: 8),
            _quantity == 0
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _quantity = 1;
                      });
                    },
                    child: Text('139 руб'),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
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
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            if (_quantity < 10) {
                              _quantity++;
                            }
                          });
                        },
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_coffee_menu/src/common/widgets/category.dart';
import 'package:flutter_coffee_menu/src/common/widgets/item.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _categoryScrollController = ScrollController();
  final Map<String, GlobalKey> _categoryKeys = {
    'Черный кофе': GlobalKey(),
    'Кофе с молоком': GlobalKey(),
    'Чай': GlobalKey(),
    'Авторские напитки': GlobalKey(),
    'Десерты': GlobalKey(),
  };
  final String defaultImageUrl = 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png';
  final bool temp = true;

  final Map<String, List<CoffeeItemData>> _categoryData = {
  'Черный кофе': [
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Эспрессо',
        price: 100),
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Американо',
        price: 120),
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Ристретто',
        price: 130),
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Лунго',
        price: 140),
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Доппио',
        price: 150),
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Макиато',
        price: 160),
  ],
  'Кофе с молоком': [
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Латте',
        price: 170),
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Капучино',
        price: 180),
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Флэт Уайт',
        price: 190),
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Мокко',
        price: 200),
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Бреве',
        price: 210),
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Рафф',
        price: 220),
  ],
  'Чай': [
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Зеленый чай',
        price: 100),
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Черный чай',
        price: 120),
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Улун',
        price: 130),
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Пуэр',
        price: 140),
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Холодный чай',
        price: 150),
  ],
  'Авторские напитки': [
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Ароматное Перо',
        price: 200),
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Кофе Мастерской',
        price: 220),
    CoffeeItemData(
        imageUrl: 'https://cdn2.iconfinder.com/data/icons/drinks-and-beverage-containers/100/08-512.png',
        name: 'Вампир',
        price: 220),
  ],
  'Десерты': [
    CoffeeItemData(
        imageUrl: 'https://cdn-icons-png.flaticon.com/256/76/76257.png',
        name: 'Чизкейк',
        price: 300),
    CoffeeItemData(
        imageUrl: 'https://cdn-icons-png.flaticon.com/256/76/76257.png',
        name: 'Тирамису',
        price: 320),
    CoffeeItemData(
        imageUrl: 'https://cdn-icons-png.flaticon.com/256/76/76257.png',
        name: 'Безе',
        price: 340),
    CoffeeItemData(
        imageUrl: 'https://cdn-icons-png.flaticon.com/256/76/76257.png',
        name: 'Панна котта',
        price: 400),
    ],
  };

  String _activeCategory = 'Черный кофе';

  void _scrollToCategory(String category) {
    final keyContext = _categoryKeys[category]?.currentContext;
    if (keyContext != null) {
      _scrollController.removeListener(_onScroll);
      Scrollable.ensureVisible(keyContext, duration: const Duration(seconds: 1), curve: Curves.easeInQuad, alignmentPolicy: ScrollPositionAlignmentPolicy.explicit).then((_) {
        _scrollController.addListener(_onScroll);
      });
      setState(() {
        _activeCategory = category;
      });
    }
  }

  void _onScroll() {
    double minDistance = double.infinity;
    String closestCategory = _activeCategory;

    _categoryKeys.forEach((category, key) {
      final keyContext = key.currentContext;
      if (keyContext != null) {
        final renderObject = keyContext.findRenderObject();
        if (renderObject is RenderSliverToBoxAdapter) {
          final box = renderObject.child as RenderBox;
            final position = box.localToGlobal(Offset.zero).dy;
            final distance = (position - kToolbarHeight * 2.0).abs();
            if (distance < minDistance) {
              minDistance = distance;
              closestCategory = category;
            }
        }
      }
    });

    setState(() {
      _activeCategory = closestCategory;
      final index = _categoryKeys.keys.toList().indexOf(closestCategory);
      _categoryScrollController.animateTo(
        index * 100.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInQuad,
      );
    });
  }
  
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _categoryScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).appBarTheme.surfaceTintColor,
        title: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Container(
            height: 40,
            alignment: Alignment.center,
            child: SizedBox(
              height: 36.0,
              child: ListView.builder(
                controller: _categoryScrollController,
                scrollDirection: Axis.horizontal,
                itemCount: _categoryKeys.keys.length,
                itemBuilder: (context, index) {
                  String category = _categoryKeys.keys.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: WidgetStateProperty.all<double>(0),
                        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                          (_) {
                            if (category == _activeCategory) {
                              return const Color.fromARGB(199, 63, 4, 4);
                            }
                            return Colors.white;
                          },
                        ),
                      ),
                      onPressed: () {
                        _scrollToCategory(category);
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _categoryScrollController.animateTo(
                            index * 150,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        });
                      },
                      child: Text(
                        category,
                        style: TextStyle(
                          color: category == _activeCategory ? Colors.white : Colors.black,
                          fontFamily: '.SF UI Display',
                        ),
                      ),
                    ),
                    );
                },
              ),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: _categoryKeys.keys.map((category) {
          return SliverToBoxAdapter(
            key: _categoryKeys[category],
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: CoffeeCategory(
                title: category,
                items: _categoryData[category]!,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
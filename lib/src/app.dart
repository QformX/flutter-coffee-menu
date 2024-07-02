import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_coffee_menu/src/common/widgets/category.dart';

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
  String _activeCategory = 'Черный кофе';

  void _scrollToCategory(String category) {
    final keyContext = _categoryKeys[category]?.currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(keyContext, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
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
          final distance = (position - kToolbarHeight).abs();
          if (distance < minDistance) {
            minDistance = distance;
            closestCategory = category;
          }
      }
    }
  });

  setState(() {
    _activeCategory = closestCategory;
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
        title: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Container(
            alignment: Alignment.center,
            child: SizedBox(
              height: 48.0,
              child: ListView.builder(
                controller: _categoryScrollController,
                scrollDirection: Axis.horizontal,
                itemCount: _categoryKeys.keys.length,
                itemBuilder: (context, index) {
                  String category = _categoryKeys.keys.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        _scrollToCategory(category);
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _categoryScrollController.animateTo(
                            index * 100.0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        });
                      },
                      child: Chip(
                        label: Text(category),
                        backgroundColor: _activeCategory == category ? Colors.blue.shade100 : Colors.grey.shade200,
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
              child: CoffeeCategory(title: category),
            ),
          );
        }).toList(),
      ),
    );
  }
}


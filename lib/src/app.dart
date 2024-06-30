import 'package:flutter/material.dart';
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
  };
  String _activeCategory = 'Черный кофе';

  void _scrollToCategory(String category) {
    final keyContext = _categoryKeys[category]?.currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(keyContext, duration: Duration(seconds: 1), curve: Curves.easeInOut);
      setState(() {
        _activeCategory = category;
      });
    }
  }

  void _onScroll() {
    for (var entry in _categoryKeys.entries) {
      final keyContext = entry.value.currentContext;
      if (keyContext != null) {
        final box = keyContext.findRenderObject() as RenderBox;
        if (box.localToGlobal(Offset.zero).dy < 150) {
          setState(() {
            _activeCategory = entry.key;
          });
          break;
        }
      }
    }
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
          preferredSize: Size.fromHeight(48.0),
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              controller: _categoryScrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _categoryKeys.keys.map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        _scrollToCategory(category);
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _categoryScrollController.animateTo(
                            _categoryKeys.keys.toList().indexOf(category) * 100.0,
                            duration: Duration(milliseconds: 500),
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
                }).toList(),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        children: _categoryKeys.keys.map((category) {
          return Padding(
            key: _categoryKeys[category],
            padding: const EdgeInsets.only(bottom: 16),
            child: CoffeeCategory(title: category),
          );
        }).toList(),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_coffee_menu/src/common/constants/constant.dart';
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

  final Map<String, List<CoffeeItemData>> _categoryData = categoryData;

  String _activeCategory = categoryData.keys.first;
  bool _isAnimating = false;

  void _scrollToCategory(String category) {
    if (_isAnimating) return;

    final keyContext = _categoryKeys[category]?.currentContext;
    if (keyContext != null) {
      _isAnimating = true;
      _scrollController.removeListener(_onScroll);
      Scrollable.ensureVisible(keyContext, duration: const Duration(milliseconds: 300), curve: Curves.easeInQuad, alignmentPolicy: ScrollPositionAlignmentPolicy.explicit).then((_) {
        _scrollController.addListener(_onScroll);
        _isAnimating = false;
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
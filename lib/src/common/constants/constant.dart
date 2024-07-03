import 'package:flutter_coffee_menu/src/common/widgets/item.dart';

const undefineCoffee = 'assets/images/undefine-coffee.png';
const undefineDesert = 'assets/images/undefine-desert.png';

final Map<String, List<CoffeeItemData>> categoryData = {
  'Черный кофе': [
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Эспрессо',
        price: 100),
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Американо',
        price: 120),
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Ристретто',
        price: 130),
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Лунго',
        price: 140),
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Доппио',
        price: 150),
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Макиато',
        price: 160),
  ],
  'Кофе с молоком': [
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Латте',
        price: 170),
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Капучино',
        price: 180),
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Флэт Уайт',
        price: 190),
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Мокко',
        price: 200),
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Бреве',
        price: 210),
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Рафф',
        price: 220),
  ],
  'Чай': [
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Зеленый чай',
        price: 100),
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Черный чай',
        price: 120),
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Улун',
        price: 130),
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Пуэр',
        price: 140),
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Холодный чай',
        price: 150),
  ],
  'Авторские напитки': [
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Ароматное Перо',
        price: 200),
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Кофе Мастерской',
        price: 220),
    CoffeeItemData(
        imageUrl: undefineCoffee,
        name: 'Вампир',
        price: 220),
  ],
  'Десерты': [
    CoffeeItemData(
        imageUrl: undefineDesert,
        name: 'Чизкейк',
        price: 300),
    CoffeeItemData(
        imageUrl: undefineDesert,
        name: 'Тирамису',
        price: 320),
    CoffeeItemData(
        imageUrl: undefineDesert,
        name: 'Безе',
        price: 340),
    CoffeeItemData(
        imageUrl: undefineDesert,
        name: 'Панна котта',
        price: 400),
    ],
  };
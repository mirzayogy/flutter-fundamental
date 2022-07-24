import 'package:b01_submission01/src/shared/classes/drink.dart';
import 'package:b01_submission01/src/shared/classes/food.dart';

class Menus {
  List<Food> foods;
  List<Drink> drinks;

  Menus({required this.foods, required this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
      foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
      drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))));

  // Menu.fromJson(Map<String, dynamic> menu) {
  //   foods = List<Food>.from(menu["foods"].map((x) => Food.fromJson(x)));
  //   drinks = List<Drink>.from(menu["drink"].map((x) => Drink.fromJson(x)));
  // }

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}
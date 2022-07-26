import 'package:b01_submission01/data/model/restaurant.dart';

class RestaurantResult {
  RestaurantResult(
      {required this.error,
      required this.message,
      required this.count,
      required this.restaurants});

  bool error;
  String message;
  int count;
  List<Restaurant> restaurants;

  factory RestaurantResult.fromJson(Map<String, dynamic> json) =>
      RestaurantResult(
          error: json['error'],
          message: json['message'],
          count: json['count'],
          restaurants: List<Restaurant>.from(json['restaurants']
              .map((x) => Restaurant.fromJson(x))
              .where((restaurant) =>
                  restaurant.description != null &&
                  restaurant.pictureId != null &&
                  restaurant.city != null &&
                  restaurant.rating != null)));
}

import 'dart:convert';
import 'package:b01_submission01/data/model/category.dart';
import 'package:b01_submission01/data/model/customer_review.dart';
import 'package:b01_submission01/data/model/menu.dart';
import 'package:b01_submission01/data/model/restaurant.dart';

class RestaurantDetailResult {
  bool error;
  String message;
  Restaurant restaurant;

  RestaurantDetailResult({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory RestaurantDetailResult.fromJson(
          Map<String, dynamic> restaurantDetailResult) =>
      RestaurantDetailResult(
          error: restaurantDetailResult['error'],
          message: restaurantDetailResult['message'],
          restaurant: Restaurant.fromJson(
            restaurantDetailResult['restaurant'],
          ));
}

List<RestaurantDetail> parseRestaurantDetailResult(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json)['restaurantDetail'];
  return parsed.map((json) => RestaurantDetail.fromJson(json)).toList();
}

class RestaurantDetail {
  String? id;
  String name;
  String? description;
  String? city;
  String address;
  String pictureId;
  num? rating;
  List<Category>? categories;
  Menus? menus;
  List<CustomerReview>? customerReviews;

  RestaurantDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.rating,
    required this.categories,
    required this.menus,
    required this.customerReviews,
  });

  factory RestaurantDetail.fromJson(Map<String, dynamic> restaurant) =>
      RestaurantDetail(
          id: restaurant['id'],
          name: restaurant['name'],
          description: restaurant['description'],
          city: restaurant['city'],
          address: restaurant['address'],
          pictureId: restaurant['pictureId'],
          rating: restaurant['rating'],
          categories: List<Category>.from(
              restaurant["categories"].map((x) => Category.fromJson(x))),
          menus: Menus.fromJson(
            restaurant['menus'],
          ),
          customerReviews: List<CustomerReview>.from(
              restaurant["customerReviews"]
                  .map((x) => CustomerReview.fromJson(x))));
}

List<RestaurantDetail> parseRestaurantDetails(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json)['restaurants'];
  return parsed.map((json) => RestaurantDetail.fromJson(json)).toList();
}

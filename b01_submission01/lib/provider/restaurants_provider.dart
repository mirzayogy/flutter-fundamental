import 'package:b01_submission01/data/api/api_service.dart';
import 'package:b01_submission01/data/model/restaurant_result.dart';
import 'package:flutter/material.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantsProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantsProvider({required this.apiService}) {
    _fetchAllRestaurant();
  }

  late RestaurantResult _restaurantsResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantResult get result => _restaurantsResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.getList();
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantsResult = restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}

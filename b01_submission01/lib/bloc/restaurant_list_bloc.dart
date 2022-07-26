import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:b01_submission01/data/api/api_service.dart';
import 'package:b01_submission01/data/model/restaurant.dart';
import 'package:rxdart/rxdart.dart';

class RestaurantListBloc extends Bloc {
  final _streamController = StreamController<String?>();
  late Stream<List<Restaurant>?> restaurantsStream;

  RestaurantListBloc() : super(null) {
    restaurantsStream = _streamController.stream
        .startWith(null)
        .debounceTime(const Duration(milliseconds: 100))
        .switchMap(
            (value) => ApiService().getListBloc().asStream().startWith(null));
  }
}

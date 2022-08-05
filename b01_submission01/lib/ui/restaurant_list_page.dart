import 'package:b01_submission01/data/api/api_service.dart';
import 'package:b01_submission01/data/model/restaurant_result.dart';
import 'package:b01_submission01/provider/restaurants_provider.dart';
import 'package:b01_submission01/ui/card_restaurant.dart';
import 'package:b01_submission01/widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantListPage extends StatefulWidget {
  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  late Future<RestaurantResult> _restaurantResult;

  @override
  void initState() {
    super.initState();
    _restaurantResult = ApiService().getList();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildList(BuildContext context) {
    return Consumer<RestaurantsProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var restaurant = state.result.restaurants[index];
              return CardRestaurant(restaurant: restaurant);
            },
          );
        } else if (state.state == ResultState.noData) {
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else if (state.state == ResultState.error) {
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else {
          return const Center(
            child: Material(
              child: Text(''),
            ),
          );
        }
      },
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Restaurants"),
        transitionBetweenRoutes: false,
        backgroundColor: Colors.amber,
      ),
      child: _buildList(context),
    );
  }
}

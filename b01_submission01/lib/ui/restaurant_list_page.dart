import 'package:b01_submission01/data/api/api_service.dart';
import 'package:b01_submission01/data/model/restaurant_result.dart';
import 'package:b01_submission01/ui/card_restaurant.dart';
import 'package:b01_submission01/widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return FutureBuilder<RestaurantResult>(
        future: _restaurantResult,
        builder: (context, AsyncSnapshot<RestaurantResult> snapshot) {
          final results = snapshot.data;
          var state = snapshot.connectionState;
          if (state != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: results?.restaurants.length,
                itemBuilder: (context, index) {
                  var restaurant = results!.restaurants[index];
                  return CardRestaurant(restaurant: restaurant);
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return const Text('');
            }
          }
        });
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

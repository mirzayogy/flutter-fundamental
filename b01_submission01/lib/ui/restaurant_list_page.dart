import 'package:b01_submission01/bloc/restaurant_list_bloc.dart';
import 'package:b01_submission01/data/model/restaurant.dart';
import 'package:b01_submission01/ui/card_restaurant.dart';
import 'package:b01_submission01/widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<RestaurantListBloc>(context);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Restaurants"),
        transitionBetweenRoutes: false,
        backgroundColor: Colors.amber,
      ),
      child: StreamBuilder<List<Restaurant>?>(
          stream: blocProvider.restaurantsStream,
          builder: (context, snapshot) {
            final results = snapshot.data;
            if (results == null) {
              return const Center(child: CircularProgressIndicator());
            } else if (results.isEmpty) {
              return const Center(child: Text('No Results'));
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: results.length,
              itemBuilder: (context, index) {
                var restaurant = results[index];
                return CardRestaurant(restaurant: restaurant);
              },
            );
          }),
    );

    // return PlatformWidget(
    //   androidBuilder: _buildAndroid,
    //   iosBuilder: _buildIos,
    //   blocProvider: blocProvider,
    // );
  }

  Widget _buildList(BuildContext context) {
    final blocProvider = BlocProvider.of<RestaurantListBloc>(context);

    return StreamBuilder<List<Restaurant>?>(
        stream: blocProvider.restaurantsStream,
        builder: (context, snapshot) {
          final results = snapshot.data;
          if (results == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (results.isEmpty) {
            return const Center(child: Text('No Results'));
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: results.length,
            itemBuilder: (context, index) {
              var restaurant = results[index];
              return CardRestaurant(restaurant: restaurant);
            },
          );
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

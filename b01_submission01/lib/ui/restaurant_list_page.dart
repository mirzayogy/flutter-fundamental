import 'package:b01_submission01/data/model/restaurant.dart';
import 'package:b01_submission01/widgets/image_clipper.dart';
import 'package:b01_submission01/widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({Key? key}) : super(key: key);

  Widget _buildList(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/local_restaurant.json'),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          // loading widget
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            // success widget
            final List<Restaurant> restaurants =
                parseRestaurants(snapshot.data);
            return ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return _buildRestaurantItem(context, restaurants[index]);
              },
            );
          } else if (snapshot.hasError) {
            // error widget
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            // loading widget
            return const Center(child: CircularProgressIndicator());
          }
        }
      },
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return Material(
      color: Colors.white,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: ClippedImage(
          restaurant.pictureId,
          width: 60,
          height: 80,
        ),
        title: Text(
          restaurant.name,
        ),
        subtitle: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 12,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(restaurant.city),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  size: 12,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(restaurant.rating.toString()),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, RestaurantDetailPage.routeName,
              arguments: restaurant);
        },
      ),
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

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}

import 'package:b01_submission01/data/model/restaurant.dart';
import 'package:b01_submission01/ui/detail_page.dart';
import 'package:b01_submission01/widgets/image_clipper.dart';
import 'package:flutter/material.dart';

class CardRestaurant extends StatelessWidget {
  final Restaurant restaurant;

  const CardRestaurant({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: ClippedImage(
          "https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}",
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
}

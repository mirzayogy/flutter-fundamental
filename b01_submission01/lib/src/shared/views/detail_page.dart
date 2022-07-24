import 'package:b01_submission01/src/shared/classes/restaurant.dart';
import 'package:b01_submission01/src/shared/views/image_clipper.dart';
import 'package:flutter/material.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/Restaurant_detail';

  final Restaurant restaurant;
  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(restaurant.name),
          ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            ClippedImage(
              restaurant.pictureId,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
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
                    height: 16,
                  ),
                  const Text(
                    "Deskripsi",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    restaurant.description,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 105, 104, 104)),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Menu",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    restaurant.description,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 105, 104, 104)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

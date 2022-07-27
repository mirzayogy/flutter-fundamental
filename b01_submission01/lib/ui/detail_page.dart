import 'package:b01_submission01/data/api/api_service.dart';
import 'package:b01_submission01/data/model/restaurant.dart';
import 'package:b01_submission01/data/model/restaurant_detail.dart';
import 'package:b01_submission01/widgets/image_clipper.dart';
import 'package:flutter/material.dart';

class RestaurantDetailPage extends StatefulWidget {
  static const routeName = '/Restaurant_detail';

  final Restaurant restaurant;
  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  late Future<RestaurantDetailResult> _restaurantDetail;

  @override
  void initState() {
    super.initState();
    // _restaurantDetail = ApiService().getDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          children: [
            // ClippedImage(
            //   _restaurantDetail.,
            // ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "restaurant.name",
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
                      Text("restaurant.city"),
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
                  // Text(
                  //   restaurant.description,
                  //   style: const TextStyle(
                  //       fontSize: 16,
                  //       color: Color.fromARGB(255, 105, 104, 104)),
                  // ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Foods",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  // SizedBox(
                  //   height: 220,
                  //   child: _buildGrid(context, restaurant, "food")
                  // ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    "Drinks",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  // SizedBox(
                  //     height: 220,
                  //     child: _buildGrid(context, restaurant, "drink")),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                ],
              ),
            ),
            // _buildList(context, restaurant),
          ],
        ),
      ),
    );
  }
}

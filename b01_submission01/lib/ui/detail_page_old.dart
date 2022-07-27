// import 'package:b01_submission01/data/model/category.dart';
// import 'package:b01_submission01/data/model/restaurant.dart';
// import 'package:b01_submission01/widgets/image_clipper.dart';
// import 'package:flutter/material.dart';

// class RestaurantDetailPage extends StatelessWidget {
//   static const routeName = '/Restaurant_detail';

//   final Restaurant restaurant;
//   const RestaurantDetailPage({Key? key, required this.restaurant})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
//         child: Column(
//           children: [
//             ClippedImage(
//               restaurant.pictureId,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   Text(
//                     restaurant.name,
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   Row(
//                     children: [
//                       const Icon(
//                         Icons.location_on,
//                         size: 12,
//                       ),
//                       const SizedBox(
//                         width: 6,
//                       ),
//                       Text(restaurant.city),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   const Text(
//                     "Deskripsi",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   Text(
//                     restaurant.description,
//                     style: const TextStyle(
//                         fontSize: 16,
//                         color: Color.fromARGB(255, 105, 104, 104)),
//                   ),
//                   const SizedBox(height: 10),
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   const Text(
//                     "Foods",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 32,
//                   ),
//                   SizedBox(
//                       height: 220,
//                       child: _buildGrid(context, restaurant, "food")),
//                   const SizedBox(
//                     height: 32,
//                   ),
//                   const Text(
//                     "Drinks",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 32,
//                   ),
//                   SizedBox(
//                       height: 220,
//                       child: _buildGrid(context, restaurant, "drink")),
//                   const SizedBox(
//                     height: 16,
//                   ),
//                 ],
//               ),
//             ),
//             // _buildList(context, restaurant),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget _buildGrid(
//     BuildContext context, Restaurant restaurant, String category) {
//   int? categoryCount = category == "food"
//       ? restaurant.menus?.foods.length
//       : restaurant.menus?.drinks.length;

//   List<Category>? lists =
//       category == "food" ? restaurant.menus!.foods : restaurant.menus?.drinks;

//   String urlImage = category == "food"
//       ? 'https://cdn-icons-png.flaticon.com/512/4629/4629522.png'
//       : 'https://cdn-icons-png.flaticon.com/512/820/820603.png';

//   return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: 200,
//           childAspectRatio: 3 / 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10),
//       itemCount: categoryCount,
//       itemBuilder: (BuildContext ctx, index) {
//         return _buildItem(context, lists![index], urlImage);
//       });
// }

// Widget _buildItem(BuildContext context, dynamic list, String urlImage) {
//   return Material(
//     child: Container(
//       decoration: BoxDecoration(
//           color: Colors.amber, borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Align(
//             alignment: Alignment.centerRight,
//             child: ClippedImage(
//               urlImage,
//               width: 40,
//               height: 40,
//             ),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           Expanded(
//             child: Text(
//               list.name,
//               textAlign: TextAlign.left,
//             ),
//           ),
//           const Text(
//             "IDR 15.000",
//             textAlign: TextAlign.left,
//             style: TextStyle(
//               fontSize: 10,
//             ),
//           ),
//         ]),
//       ),
//     ),
//   );
// }

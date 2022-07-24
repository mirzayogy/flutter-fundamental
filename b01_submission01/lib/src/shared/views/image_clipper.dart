import 'package:flutter/material.dart';

class ClippedImage extends StatelessWidget {
  const ClippedImage(
    this.image, {
    this.fit,
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  final String image;
  final BoxFit? fit;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        image,
        fit: fit ?? BoxFit.cover,
        height: height,
        width: width,
      ),
    );
  }
}

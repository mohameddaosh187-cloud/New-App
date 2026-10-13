import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageNews extends StatelessWidget {
  const CustomImageNews({super.key, this.height = 200, required this.image});
  final double height;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(12),
      child: CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) => Column(
          mainAxisAlignment: .center,
          children: [CircularProgressIndicator()],
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
        width: double.infinity,
        height: height,
        fit: .cover,
      ),
    );
  }
}

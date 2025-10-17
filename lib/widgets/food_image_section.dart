import 'package:flutter/material.dart';

class FoodImageSection extends StatelessWidget {
  final String imageUrl;
  final double rating;

  const FoodImageSection({
    super.key,
    required this.imageUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Center(
        // TODO: Replace with actual image asset
        child: Icon(Icons.fastfood, size: 120, color: Colors.grey[400]),
      ),
    );
  }
}

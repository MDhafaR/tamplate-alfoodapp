import 'extra_item.dart';
import 'review.dart';

class FoodItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final String imageUrl;
  final String category;
  final List<String> ingredients;
  final String deliveryTime;
  final Map<String, double> sizeOptions;
  final List<ExtraItem> extras;
  final List<Review> reviews;

  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.category,
    this.ingredients = const [],
    this.deliveryTime = '15-20 min',
    this.sizeOptions = const {},
    this.extras = const [],
    this.reviews = const [],
  });
}

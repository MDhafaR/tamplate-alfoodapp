import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../widgets/food_detail_header.dart';
import '../widgets/food_image_section.dart';
import '../widgets/food_info_section.dart';
import '../widgets/ingredients_section.dart';
import '../widgets/size_selection_section.dart';
import '../widgets/special_instructions_section.dart';
import '../widgets/reviews_section.dart';

class FoodDetailPage extends StatefulWidget {
  final FoodItem foodItem;

  const FoodDetailPage({super.key, required this.foodItem});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  String selectedSize = '';
  bool isFavorite = false;
  TextEditingController specialInstructionsController = TextEditingController();
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    // Set default size to the first option
    if (widget.foodItem.sizeOptions.isNotEmpty) {
      selectedSize = widget.foodItem.sizeOptions.keys.first;
    }
  }

  @override
  void dispose() {
    specialInstructionsController.dispose();
    super.dispose();
  }

  double getTotalPrice() {
    double basePrice = widget.foodItem.price;

    // Add size price
    if (widget.foodItem.sizeOptions.isNotEmpty && selectedSize.isNotEmpty) {
      basePrice += widget.foodItem.sizeOptions[selectedSize] ?? 0.0;
    }

    // TODO: Add extras price calculation for learning checkbox interaction

    return basePrice * quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            FoodDetailHeader(
              title: 'Food Details',
              isFavorite: isFavorite,
              onBackPressed: () => Navigator.pop(context),
              onFavoritePressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FoodImageSection(
                      imageUrl: widget.foodItem.imageUrl,
                      rating: widget.foodItem.rating,
                    ),
                    FoodInfoSection(
                      name: widget.foodItem.name,
                      description: widget.foodItem.description,
                      price: widget.foodItem.price,
                      deliveryTime: widget.foodItem.deliveryTime,
                    ),
                    IngredientsSection(
                      ingredients: widget.foodItem.ingredients,
                    ),
                    SizeSelectionSection(
                      sizeOptions: widget.foodItem.sizeOptions,
                      selectedSize: selectedSize,
                    ),
                    // TODO: Add ExtrasSection for learning checkbox interaction
                    SpecialInstructionsSection(
                      controller: specialInstructionsController,
                    ),
                    ReviewsSection(reviews: widget.foodItem.reviews),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

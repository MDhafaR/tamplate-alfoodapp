import 'package:alfoodapp/widgets/vertical_food_item_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/header_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/category_item_widget.dart';
import '../widgets/offer_banner_widget.dart';
import '../models/category.dart';
import '../models/food_item.dart';
import '../widgets/view_switcher.dart';
import '../data/mock_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categories = [];
  List<FoodItem> foodItems = [];
  String? selectedCategoryId;
  bool showOfferBanner = true;

  @override
  void initState() {
    super.initState();
    categories = MockData.getCategories();
    foodItems = MockData.getFoodItems();
  }

  void _selectCategory(String categoryId) {
    setState(() {
      if (selectedCategoryId == categoryId) {
        selectedCategoryId = null;
        categories = categories.map((category) {
          return category.copyWith(isSelected: false);
        }).toList();
      } else {
        categories = categories.map((category) {
          return category.copyWith(isSelected: category.id == categoryId);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderWidget(),
              const SizedBox(height: 20),
              const SearchBarWidget(),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryItemWidget(
                            category: categories[index],
                            onTap: () => _selectCategory(categories[index].id),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              OfferBannerWidget(isVisible: showOfferBanner),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Popular Dishes',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        ViewSwitcher(
                          onViewChanged: (isGridView) {
                            // TODO: ViewSwitcher tetap ada tapi tidak berfungsi
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: foodItems.length,
                      itemBuilder: (context, index) {
                        return VerticalFoodItemWidget(
                          foodItem: foodItems[index],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

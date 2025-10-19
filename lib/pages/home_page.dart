import 'package:alfoodapp/widgets/vertical_food_item_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/header_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/category_item_widget.dart';
import '../widgets/offer_banner_widget.dart';
import '../widgets/view_switcher.dart';
import '../widgets/food_card_widget.dart';
import '../models/category.dart';
import '../models/food_item.dart';
import '../data/mock_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categories = [];
  List<FoodItem> foodItems = [];
  String? selectedCategoryId; // Changed to nullable to allow no selection
  bool showOfferBanner = true; // Parameter to control offer banner visibility
  bool isGridView = false; // State to control view mode

  @override
  void initState() {
    super.initState();
    categories = MockData.getCategories();
    foodItems = MockData.getFoodItems();
  }

  void _selectCategory(String categoryId) {
    setState(() {
      // If clicking the same category, deselect it
      if (selectedCategoryId == categoryId) {
        selectedCategoryId = null;
        categories = categories.map((category) {
          return category.copyWith(isSelected: false);
        }).toList();
      } else {
        // Select new category
        selectedCategoryId = categoryId;
        categories = categories.map((category) {
          return category.copyWith(isSelected: category.id == categoryId);
        }).toList();
      }
    });
  }

  void _onViewChanged(bool isGridView) {
    setState(() {
      this.isGridView = isGridView;
    });
  }

  // TODO: TUGAS - Buat fungsi untuk menghitung tinggi GridView
  // Tips: GridView punya 2 kolom, perlu hitung berapa baris yang dibutuhkan
  // Tips: Gunakan MediaQuery untuk mendapatkan lebar layar
  double _calculateGridHeight(int itemCount) {
    return 500.0; // Ganti dengan perhitungan yang tepat
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
              // Categories Section
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
              // Offer Banner
              OfferBannerWidget(isVisible: showOfferBanner),
              const SizedBox(height: 24),
              // Food Items Section
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
                        ViewSwitcher(onViewChanged: _onViewChanged),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // TODO: TUGAS - Buat conditional rendering: jika isGridView true tampilkan GridView, jika false tampilkan ListView
                    // Tips: Gunakan GridView.builder dengan 2 kolom dan gunakan widget FoodCardWidget

                    // TODO: Ganti Container info tugas di bawah dengan implementasi GridView.builder
                    isGridView
                        ? Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.orange.shade200,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.grid_view,
                                  size: 48,
                                  color: Colors.orange.shade700,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  '⚠️ TUGAS: Membuat Grid View ⚠️',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade900,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Implementasikan GridView.builder di sini\nGunakan widget: FoodCardWidget',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.orange.shade800,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
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

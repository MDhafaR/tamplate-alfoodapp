import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryItemWidget extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryItemWidget({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Circular button with icon
            Container(
              width: 60,
              height: 60,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: category.isSelected ? Colors.green : Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: SizedBox()
            ),
            const SizedBox(height: 8),
            // Category name
            Text(
              category.name,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getCategoryIconPath(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'pizza':
        return 'assets/icons/pizza.svg';
      case 'burgers':
        return 'assets/icons/burger.svg';
      case 'chicken':
        return 'assets/icons/chicken.svg';
      case 'seafood':
        return 'assets/icons/seafood.svg';
      case 'drink':
        return 'assets/icons/drink.svg';
      default:
        return 'assets/icons/pizza.svg';
    }
  }
}

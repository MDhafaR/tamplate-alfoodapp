import 'food_item.dart';
import 'extra_item.dart';

class CartItem {
  final String id;
  final FoodItem foodItem;
  final int quantity;
  final String? selectedSize;
  final List<ExtraItem> selectedExtras;
  final String? specialInstructions;

  CartItem({
    required this.id,
    required this.foodItem,
    required this.quantity,
    this.selectedSize,
    this.selectedExtras = const [],
    this.specialInstructions,
  });

  double get totalPrice {
    double basePrice = foodItem.price;
    
    // Add size price if selected
    if (selectedSize != null && foodItem.sizeOptions.containsKey(selectedSize)) {
      basePrice += foodItem.sizeOptions[selectedSize]!;
    }
    
    // Add extras price
    double extrasPrice = selectedExtras.fold(0.0, (sum, extra) => sum + extra.price);
    
    return (basePrice + extrasPrice) * quantity;
  }

  CartItem copyWith({
    String? id,
    FoodItem? foodItem,
    int? quantity,
    String? selectedSize,
    List<ExtraItem>? selectedExtras,
    String? specialInstructions,
  }) {
    return CartItem(
      id: id ?? this.id,
      foodItem: foodItem ?? this.foodItem,
      quantity: quantity ?? this.quantity,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedExtras: selectedExtras ?? this.selectedExtras,
      specialInstructions: specialInstructions ?? this.specialInstructions,
    );
  }
}

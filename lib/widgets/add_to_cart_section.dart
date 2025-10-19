import 'package:flutter/material.dart';

class AddToCartSection extends StatelessWidget {
  final int quantity;
  final double totalPrice;
  final VoidCallback onQuantityDecrease;
  final VoidCallback onQuantityIncrease;
  final VoidCallback onAddToCart;

  const AddToCartSection({
    super.key,
    required this.quantity,
    required this.totalPrice,
    required this.onQuantityDecrease,
    required this.onQuantityIncrease,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: TUGAS - Buat UI untuk quantity selector dan tombol Add to Cart
    // Tips: Gunakan Row untuk layout horizontal
    // Tips: Quantity selector butuh 3 elemen: tombol minus, text quantity, tombol plus
    // Tips: Button Add to Cart gunakan Expanded agar memenuhi sisa lebar

    // TODO: Ganti Container info tugas di bawah dengan implementasi Row yang berisi quantity selector dan button
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue.shade200, width: 2),
        ),
        child: Column(
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 48,
              color: Colors.blue.shade700,
            ),
            const SizedBox(height: 12),
            Text(
              'TUGAS: Membuat Add to Cart Section',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Implementasikan UI dengan:\n• Quantity selector (-, angka, +)\n• Button Add to Cart dengan total harga',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.blue.shade800),
            ),
          ],
        ),
      ),
    );
  }
}

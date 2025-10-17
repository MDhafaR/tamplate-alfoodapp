import 'package:flutter/material.dart';

class SizeSelectionSection extends StatelessWidget {
  final Map<String, double> sizeOptions;
  final String selectedSize;

  const SizeSelectionSection({
    super.key,
    required this.sizeOptions,
    required this.selectedSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Size',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 12),
          sizeOptions.isNotEmpty
              ? Row(
                  children: sizeOptions.entries.map((entry) {
                    // final isSelected = selectedSize == entry.key;
                    String priceText;
                    if (entry.value == 0) {
                      priceText = '+\$0';
                    } else {
                      priceText = '+\$${entry.value.round()}';
                    }
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          // TODO: Add GestureDetector for learning interaction
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey[300]!,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Text(
                                entry.key,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                priceText,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )
              : const Text(
                  'No size options available',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
// TODO: Import flutter_bloc untuk state management
// import 'package:flutter_bloc/flutter_bloc.dart';
// TODO: Import CartCubit untuk mengelola state cart
// import '../cubit/cart_cubit.dart';
import '../models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Food Image
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    cartItem.foodItem.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.fastfood,
                          color: Colors.grey,
                          size: 40,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Food Info
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItem.foodItem.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            cartItem.foodItem.description,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '\$${cartItem.foodItem.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        // Minus Button
                        // TODO: Implementasi state management untuk decrease quantity
                        GestureDetector(
                          onTap: () {
                            // TODO: Implementasi updateQuantity dengan Cubit
                            // context.read<CartCubit>().updateQuantity(
                            //   cartItem.id,
                            //   cartItem.quantity - 1,
                            // );
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[300]!),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.grey,
                              size: 16,
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        // Quantity
                        Text(
                          cartItem.quantity.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(width: 12),

                        // Plus Button
                        // TODO: Implementasi state management untuk increase quantity
                        GestureDetector(
                          onTap: () {
                            // TODO: Implementasi updateQuantity dengan Cubit
                            // context.read<CartCubit>().updateQuantity(
                            //   cartItem.id,
                            //   cartItem.quantity + 1,
                            // );
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            onPressed: () {
              // TODO: Implementasi removeFromCart dengan Cubit
              // context.read<CartCubit>().removeFromCart(cartItem.id);
            },
            icon: const Icon(Icons.close, color: Colors.black, size: 20),
          ),
        ),
      ],
    );
  }
}

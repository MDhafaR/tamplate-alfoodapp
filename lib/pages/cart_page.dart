import 'package:flutter/material.dart';
// TODO: Import flutter_bloc untuk state management
// import 'package:flutter_bloc/flutter_bloc.dart';
// TODO: Import CartCubit untuk mengelola state cart
// import '../cubit/cart_cubit.dart';
// TODO: Import CartItemWidget untuk menampilkan item cart
// import '../widgets/cart_item_widget.dart';
import '../widgets/delivery_info_widget.dart';
import '../widgets/promo_code_widget.dart';
import '../widgets/order_summary_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Show more options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // TODO: Implementasi BlocBuilder untuk state management
                  // BlocBuilder<CartCubit, CartState>(
                  //   builder: (context, state) {
                  //     if (state is CartInitial) {
                  //       return const Center(child: CircularProgressIndicator());
                  //     }
                  //     if (state is CartLoaded) {
                  //       final cartCubit = context.read<CartCubit>();
                  //       if (cartCubit.cartItems.isEmpty) {
                  //         return const Center(/* Empty cart UI */);
                  //       }
                  //       return Column(/* Cart items and summary */);
                  //     }
                  //     return const Center(child: Text('Something went wrong'));
                  //   },
                  // ),

                  // TODO: Implementasi kondisi empty cart
                  const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 80,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Your cart is empty',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Add some delicious food to get started!',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // TODO: Implementasi daftar cart items dengan BlocBuilder
                  // ...cartCubit.cartItems.map(
                  //   (cartItem) => Padding(
                  //     padding: const EdgeInsets.only(bottom: 16),
                  //     child: CartItemWidget(cartItem: cartItem),
                  //   ),
                  // ),
                  const SizedBox(height: 20),

                  // Delivery Information Section
                  const DeliveryInfoWidget(),

                  const SizedBox(height: 20),

                  // Promo Code Section
                  const PromoCodeWidget(),

                  const SizedBox(height: 20),

                  // TODO: Implementasi Order Summary dengan data dari Cubit
                  // OrderSummaryWidget(
                  //   subtotal: cartCubit.subtotal,
                  //   deliveryFee: cartCubit.deliveryFee,
                  //   tax: cartCubit.tax,
                  //   total: cartCubit.total,
                  // ),

                  // Static Order Summary untuk template
                  OrderSummaryWidget(
                    subtotal: 0.0,
                    deliveryFee: 0.0,
                    tax: 0.0,
                    total: 0.0,
                  ),

                  const SizedBox(height: 100), // Space for bottom bar
                ],
              ),
            ),
          ),

          // Bottom Action Bar
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Total Amount',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    // TODO: Implementasi total amount dari Cubit
                    // Text(
                    //   '\$${cartCubit.total.toStringAsFixed(2)}',
                    //   style: const TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.green,
                    //   ),
                    // ),
                    const Text(
                      '\$0.00',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implementasi navigasi ke checkout
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Proceeding to checkout...'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Proceed to Checkout',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

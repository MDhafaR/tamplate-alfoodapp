import 'package:alfoodapp/models/cart_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> cartItems;

  CartLoaded(this.cartItems);
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  int get itemCount => _cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get subTotal =>
      _cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);

  double get deliveryFee => 0.0; //free delivery

  double get tax => subTotal * 0.08; //8% tax

  double get total => subTotal + deliveryFee + tax;

  void addToCart(CartItem newItem) {
    try {
      emit(CartLoading());

      final existingIndex = _cartItems.indexWhere(
        (existingItem) =>
            existingItem.foodItem.id == newItem.foodItem.id &&
            existingItem.selectedSize == newItem.selectedSize &&
            _listEquals(existingItem.selectedExtras, newItem.selectedExtras),
      );

      if (existingIndex != -1) {
        // Item sudah ada, update quantity
        _cartItems[existingIndex] = _cartItems[existingIndex].copyWith(
          quantity: _cartItems[existingIndex].quantity + newItem.quantity,
        );
      } else {
        // Item baru, tambahkan ke cart
        _cartItems.add(newItem);
      }

      emit(CartLoaded(_cartItems));
    } catch (e) {
      emit(CartError('Gagal menambahkan item ke keranjang: ${e.toString()}'));
    }
  }

  void removeFromCart(String cartItemId) {
    try {
      emit(CartLoading());
      _cartItems.removeWhere((item) => item.id == cartItemId);
      emit(CartLoaded(_cartItems));
    } catch (e) {
      emit(CartError('Gagal menghapus item dari keranjang: ${e.toString()}'));
    }
  }

  void clearCart() {
    try {
      emit(CartLoading());
      _cartItems.clear();
      emit(CartLoaded(_cartItems));
    } catch (e) {
      emit(CartError('Gagal mengosongkan keranjang: ${e.toString()}'));
    }
  }

  void updateQuantity(String cartItemId, int quantity) {
    try {
      emit(CartLoading());

      if (quantity <= 0) {
        removeFromCart(cartItemId);
        return;
      }

      final index = _cartItems.indexWhere((item) => item.id == cartItemId);
      if (index != -1) {
        _cartItems[index] = _cartItems[index].copyWith(quantity: quantity);
        emit(CartLoaded(_cartItems));
      } else {
        emit(CartError('Item tidak ditemukan dalam keranjang'));
      }
    } catch (e) {
      emit(CartError('Gagal mengupdate quantity: ${e.toString()}'));
    }
  }

  bool _listEquals<T>(List<T> a, List<T> b) {
    if (a.length != b.length) return false;

    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}

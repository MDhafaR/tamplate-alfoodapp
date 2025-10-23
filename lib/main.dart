import 'package:flutter/material.dart';
// TODO: Import flutter_bloc untuk state management
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/main_page.dart';
// TODO: Import CartCubit untuk mengelola state cart
// import 'cubit/cart_cubit.dart';

void main() {
  runApp(const AlFoodApp());
}

class AlFoodApp extends StatelessWidget {
  const AlFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Implementasi BlocProvider untuk state management
    // return BlocProvider(
    //   create: (context) => CartCubit(),
    //   child: MaterialApp(
    //     title: 'AlFood',
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
    //       useMaterial3: true,
    //     ),
    //     home: const MainPage(),
    //     debugShowCheckedModeBanner: false,
    //   ),
    // );

    return MaterialApp(
      title: 'AlFood',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

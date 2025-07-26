import 'package:e_commerce_app/controllers/auth_provider.dart';
import 'package:e_commerce_app/controllers/profile_provider.dart';
import 'package:e_commerce_app/controllers/product_provider.dart';
import 'package:e_commerce_app/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => UserAuth()),
      ],
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        title: "E_commerce_app",
        theme: ThemeData(
          textTheme: TextTheme(
            bodyLarge: TextStyle(fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

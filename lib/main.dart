import 'package:auth_first_step_shopify/providers/ads_provider.dart';
import 'package:auth_first_step_shopify/providers/auth_provider.dart';
import 'package:auth_first_step_shopify/providers/categories_provider.dart';
import 'package:auth_first_step_shopify/providers/products_provider.dart';
import 'package:auth_first_step_shopify/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProviderApp()),
      Provider(create: (_) => CategoriesProvider()),
      Provider(create: (_) => AdsProvider()),
      Provider(create: (_) => ProductsProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

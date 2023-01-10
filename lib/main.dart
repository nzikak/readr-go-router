import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readr/providers/book_provider.dart';
import 'package:readr/providers/onboarding_provider.dart';
import 'package:readr/providers/tab_provider.dart';
import 'package:readr/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => OnboardingProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => TabProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => BookProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'GoRouter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
        ));
  }
}

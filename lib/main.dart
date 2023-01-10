import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readr/providers/book_provider.dart';
import 'package:readr/providers/onboarding_provider.dart';
import 'package:readr/providers/tab_provider.dart';
import 'package:readr/providers/user_provider.dart';
import 'package:readr/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final userProvider = UserProvider();
  userProvider.initialize();
  runApp(MyApp(
    userProvider: userProvider,
  ));
}

class MyApp extends StatelessWidget {
  final UserProvider userProvider;

  const MyApp({
    super.key,
    required this.userProvider,
  });

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
          ChangeNotifierProvider(create: (_) => userProvider),
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

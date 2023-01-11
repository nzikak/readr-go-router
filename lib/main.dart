import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readr/providers/book_provider.dart';
import 'package:readr/providers/onboarding_provider.dart';
import 'package:readr/providers/tab_provider.dart';
import 'package:readr/providers/user_provider.dart';
import 'package:readr/routing/app_router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final userProvider = UserProvider();
  setPathUrlStrategy();
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
    //Accesses the GoRouter object and stores it in the router variable
    final router = AppRouter(userProvider).router;
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
      child: MaterialApp.router(
        title: 'GoRouter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: router,
      ),
    );
  }
}

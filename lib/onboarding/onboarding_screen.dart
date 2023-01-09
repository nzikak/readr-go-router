import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readr/onboarding/page_item.dart';
import 'package:readr/providers/onboarding_provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            PageView(
              children: context
                  .read<OnboardingProvider>()
                  .pages
                  .map((page) => _buildPageView(page))
                  .toList(),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Skip'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPageView(PageItem page) {
    return Column(
      children: [
        Image.asset(
          page.imagePath,
          height: 300,
        ),
        const SizedBox(height: 8),
        Text(page.title),
        const SizedBox(height: 8),
        Text(page.description),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

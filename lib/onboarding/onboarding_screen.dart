import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readr/onboarding/page_item.dart';
import 'package:readr/providers/onboarding_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
    final pages = context.read<OnboardingProvider>().pages;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    context.read<OnboardingProvider>().setCurrentIndex(index);
                  },
                  controller: _pageController,
                  itemBuilder: (context, index) => _buildPageView(
                    pages[index],
                  ),
                ),
              ),
              SmoothPageIndicator(
                controller: _pageController,
                effect:
                    SwapEffect(activeDotColor: Theme.of(context).primaryColor),
                count: pages.length,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Consumer<OnboardingProvider>(
                      builder: (context, provider, child) {
                        return Text(provider.currentIndex == pages.length - 1
                            ? "Done"
                            : "Skip");
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageView(PageItem page) {
    return Column(
      children: [
        Image.asset(
          page.imagePath,
          height: 250,
        ),
        const SizedBox(height: 16),
        Text(
          page.title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 8),
        Text(
          page.description,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(color: Colors.black, fontSize: 16),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

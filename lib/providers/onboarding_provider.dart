import 'package:flutter/material.dart';
import 'package:readr/onboarding/page_item.dart';
import 'package:readr/utils/constants/images.dart';

class OnboardingProvider extends ChangeNotifier {
  final List<PageItem> _pages = [
    PageItem(
      title: "Personalized recommendations",
      description:
          "Our app uses your reading history to recommend books that we think you'll love",
      imagePath: Images.kPersonalRecommendation,
    ),
    PageItem(
      title: "Bookmark and highlight",
      description:
          "Save your favorite passages and make notes right in the app",
      imagePath: Images.kBookmark,
    ),
    PageItem(
      title: "Off-line reading",
      description:
          "Download books to your device and read them even when you're not connected to the internet",
      imagePath: Images.kBookmark,
    ),
  ];

  List<PageItem> get pages => List.unmodifiable(_pages);
}

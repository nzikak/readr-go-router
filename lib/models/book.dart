import 'package:readr/utils/constants/images.dart';

class Book {
  final String title;
  final String description;
  final String author;
  final String imagePath;
  bool isFavorite;

  Book({
    required this.title,
    required this.description,
    required this.author,
    required this.imagePath,
    this.isFavorite = false,
  });

}

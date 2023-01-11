import 'package:readr/utils/constants/images.dart';

class Book {
  final int id;
  final String title;
  final String description;
  final String author;
  final String imagePath;
  bool isFavorite;

  Book({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.imagePath,
    this.isFavorite = false,
  });

}

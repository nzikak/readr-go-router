import 'package:readr/utils/constants/images.dart';

class Book {
  final String name;
  final String description;
  final String author;
  final String imagePath;
  bool isFavorite;

  Book({
    required this.name,
    required this.description,
    required this.author,
    required this.imagePath,
    this.isFavorite = false,
  });


  static List<Book> books = [
    Book(
      name: "Outliers",
      description: "Outliers: The Story of Success is the non-fiction book written by Malcolm Gladwell and published by Little, Brown and Company on November 18, 2008. In Outliers, Gladwell examines the factors that contribute to high levels of success",
      author: "Malcolm Gladwell",
      imagePath: Images.kOutliers,
    ),
    Book(
      name: "Clean Architecture",
      description: "By applying universal rules of software architecture, you can dramatically improve developer productivity throughout the life of any software system.",
      author: "Robert C. Martin",
      imagePath: Images.kCleanArchitecture,
    ),
    Book(
      name: "Zero to One",
      description: "Zero to One: Notes on Startups, or How to Build the Future is a 2014 book by the American entrepreneur and investor Peter Thiel co-written with Blake Masters",
      author: "Peter Thiel & Blake Masters",
      imagePath: Images.kZeroToOne,
    ),
    Book(
      name: "Atomic Habits",
      description: "James Clear, an expert on habit formation, reveals practical strategies that will teach you how to form good habits, break bad ones, and master the tiny behaviors that lead to remarkable results.",
      author: "James Clear",
      imagePath: Images.kAtomicHabits,
    ),
    Book(
      name: "Designing Data-Intensive Applications",
      description: "In this practical and comprehensive guide, author Martin Kleppmann helps you navigate this diverse landscape by examining the pros and cons of various technologies for processing and storing data",
      author: "Martin Kleppmann",
      imagePath: Images.kSystemDesign,
    ),
  ];
}

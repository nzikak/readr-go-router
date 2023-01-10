import 'package:flutter/material.dart';
import 'package:readr/models/book.dart';

class BookProvider extends ChangeNotifier {

  final List<Book> _bookmarks = [];
  List<Book> get bookmarks => List.unmodifiable(_bookmarks);

  void addToBookmarks(Book book) {
    _bookmarks.add(book);
    notifyListeners();
  }

  void removeFromBookmarks(Book book) {
    _bookmarks.remove(book);
    notifyListeners();
  }
}
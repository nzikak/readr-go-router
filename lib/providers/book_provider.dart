import 'package:flutter/material.dart';
import 'package:readr/models/book.dart';

class BookProvider extends ChangeNotifier {

  final List<Book> _bookmarks = [];
  List<Book> get bookmarks => List.unmodifiable(_bookmarks);


  void favoriteBook(Book book) {
    if(book.isFavorite) {
      _removeFromBookmarks(book);
    } else {
      _addToBookmarks(book);
    }
  }

  void _addToBookmarks(Book book) {
    book.isFavorite = true;
    _bookmarks.add(book);
    notifyListeners();
  }

  void _removeFromBookmarks(Book book) {
    book.isFavorite = false;
    _bookmarks.remove(book);
    notifyListeners();
  }
}
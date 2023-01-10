import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readr/models/book.dart';
import 'package:readr/providers/book_provider.dart';
import 'package:readr/shared_widgets/book_item.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final book = Book.books[index];
          return Consumer<BookProvider>(
            builder: (context, provider, child) {
              return buildBookItem(
                context: context,
                book: book,
                onTap: () {
                  provider.favoriteBook(book);
                },
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: Book.books.length,
      ),
    );
  }
}

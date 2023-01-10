import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readr/providers/book_provider.dart';
import 'package:readr/shared_widgets/book_item.dart';

class BookmarksTab extends StatelessWidget {
  const BookmarksTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bookProvider = context.read<BookProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Consumer<BookProvider>(
        builder: (context, bookProvider, child) {
          if (bookProvider.bookmarks.isEmpty) {
            return Center(
              child: Text(
                "No bookmarks yet",
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                final book = bookProvider.bookmarks[index];
                return buildBookItem(
                  context: context,
                  book: book,
                  onTap: () {
                    bookProvider.favoriteBook(book);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: bookProvider.bookmarks.length,
            );
          }
        },
      ),
    );
  }
}

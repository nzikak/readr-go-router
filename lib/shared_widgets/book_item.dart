import 'package:flutter/material.dart';
import 'package:readr/models/book.dart';

Widget buildBookItem({
  required BuildContext context,
  required Book book,
  required VoidCallback onFav,
  VoidCallback? onTap,
}) =>
    Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(4),
        leading: Image.asset(
          book.imagePath,
          fit: BoxFit.cover,
        ),
        title: Text(
          book.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        isThreeLine: true,
        subtitle: Text(
          book.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          onPressed: onFav,
          iconSize: 30,
          icon: Icon(
            book.isFavorite ? Icons.favorite : Icons.favorite_outline_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ),
        onTap: onTap,

      ),
    );

import 'package:flutter/material.dart';

class BookModel {
  BookModel({
    //7- Requires receipt
    required this.title,
    required this.category,
    required this.pages,
    required this.numberOfStars,
    required this.color,
    required this.author,
    required this.gender,
    required this.isEbook,
    required this.bookCoverUrl,
    required this.icon,
    required this.review,
    required this.createdAt,
  });
  //8- Receipt
  final String title;
  final String category;
  final int pages;
  final int numberOfStars;
  final Color? color;
  final String? author;
  final String? gender;
  final bool isEbook;
  final String? bookCoverUrl;
  final String? icon;
  final String? review;
  final DateTime? createdAt;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'category': category,
      'pages': pages,
      'numberOfStars': numberOfStars,
      'color':
          '#${color?.value.toRadixString(16).padLeft(8, '0').toUpperCase()}', //TODO: create function
      'author': author ?? '',
      'gender': gender ?? '',
      'isEbook': isEbook,
      'bookCoverUrl': bookCoverUrl,
      'icon': icon ?? '',
      'review': review ?? '',
      'createdAt': createdAt,
    };
  }
}

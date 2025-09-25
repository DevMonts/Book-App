import 'package:flutter/material.dart';

class BookModel {
  final String title;
  final bool isPaused;
  final bool isRereading;
  final bool isEbook;
  final String? bookCoverUrl;
  final int numberOfStars;
  final bool isInWishlist;
  final Color? color;
  final String? icon;
  final int currentPage;
  final int pages;
  final String? author;
  final String? gender;
  final String? review;
  final DateTime? createdAt;
  BookModel({
    required this.title,
    this.isPaused = false,
    this.isRereading = false,
    this.isEbook = false,
    this.bookCoverUrl,
    this.numberOfStars = 3,
    this.isInWishlist = false,
    this.color,
    this.icon,
    this.currentPage = 0,
    this.pages = 0,
    this.author,
    this.gender,
    this.review,
    this.createdAt,
  });
  bool get isFinished => (currentPage == pages) ? true : false;
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isPaused': isPaused,
      'isRereading': isRereading,
      'isEbook': isEbook,
      'bookCoverUrl': bookCoverUrl,
      'numberOfStars': numberOfStars,
      'isInWishlist': isInWishlist,
      'color':
          '#${color?.value.toRadixString(16).padLeft(8, '0').toUpperCase()}',
      'icon': icon ?? '',
      'currentPage': currentPage,
      'pages': pages,
      'author': author ?? '',
      'gender': gender ?? '',
      'review': review ?? '',
      'createdAt': createdAt,
    };
  }
}

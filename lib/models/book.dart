import 'dart:convert';

class Book {
  final String id;
  final int year;
  final String title;
  final String handle;
  final String publisher;
  final String isbn;
  final int pages;
  final List<String> notes;
  final DateTime createdAt;
  final List<Map<String, dynamic>> villains;
  final String description;

  Book({
    required this.id,
    required this.year,
    required this.title,
    required this.handle,
    required this.publisher,
    required this.isbn,
    required this.pages,
    required this.notes,
    required this.createdAt,
    required this.villains,
    required this.description,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'].toString(),
      year: json['Year'] ?? 0,
      title: json['Title'] ?? '',
      handle: json['handle'] ?? '',
      publisher: json['Publisher'] ?? '',
      isbn: json['ISBN'] ?? '',
      pages: json['Pages'] ?? 0,
      notes: List<String>.from(json['Notes'] ?? []),
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      villains: List<Map<String, dynamic>>.from(json['villains'] ?? []),
      description: json['description'] ?? '',
    );
  }
}
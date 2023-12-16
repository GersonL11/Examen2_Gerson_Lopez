import 'package:examenp3_gersonlopez/models/book.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;
  BookDetailScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Detalle del Libro',
          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Título: ${book.title}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                decoration: TextDecoration.underline,
              ),
            ),
            Text(
              'ID: ${book.id}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black, 
                decoration: TextDecoration.underline,
              ),
            ),
            Text(
              'Descripción: ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black, 
              ),
            ),
            Text(
              book.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, 
              ),
            ),
            SizedBox(height: 20),
            Text(
              'VILLANOS:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
                decoration: TextDecoration.underline,
              ),
            ),
            ...book.villains.map(
              (villain) => Row(
                children: [
                  Icon(Icons.emoji_emotions, color: Colors.yellow),
                  SizedBox(width: 5),
                  Text(
                    villain['name'] ?? 'Desconocido',
                    style: TextStyle(color: Colors.black), 
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

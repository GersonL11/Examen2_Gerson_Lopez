import 'package:examenp3_gersonlopez/models/book.dart';
import 'package:examenp3_gersonlopez/providers/book_provider.dart';
import 'package:examenp3_gersonlopez/screens/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  bool isDownloaded = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<BookListProvider>(context, listen: false).fetchBook());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Libros de Stephen King',
          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 182),
      ),
      body: Consumer<BookListProvider>(
        builder: (context, bookListProvider, child) {
          if (bookListProvider.books.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: bookListProvider.books.length,
            itemBuilder: (context, index) {
              final book = bookListProvider.books[index];
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: Colors.white,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://img.freepik.com/fotos-premium/historia-libro-convierte-vida-real_665280-24386.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    book.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    book.description,
                    style: TextStyle(fontFamily: 'Roboto'),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      book.isMarked ? Icons.favorite : Icons.favorite_border,
                      color: book.isMarked ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        book.isMarked = !book.isMarked;
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailScreen(book: book),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 86, 155, 233),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MarkedBooksScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, 
                  onPrimary: Color.fromARGB(255, 6, 3, 147),
                ),
                child: Text('Ver Libros Favoritos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MarkedBooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Libros Marcados',
          style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 25, 3, 154),
      ),
      body: Consumer<BookListProvider>(
        builder: (context, bookListProvider, child) {
          final markedBooks = bookListProvider.books
              .where((book) => book.isMarked)
              .toList();

          if (markedBooks.isEmpty) {
            return Center(child: Text('No hay libros marcados.'));
          }

          return ListView.builder(
            itemCount: markedBooks.length,
            itemBuilder: (context, index) {
              final book = markedBooks[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetailScreen(book: book),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  color: Colors.white, 
                  child: ListTile(
                    title: Text(
                      book.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(book.description),
                    trailing: IconButton(
                      icon: Icon(Icons.favorite, color: Color.fromARGB(255, 17, 4, 143)),
                      onPressed: () {
                        
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

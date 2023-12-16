import 'package:flutter/material.dart';
import 'package:examenp3_gersonlopez/providers/book_provider.dart';
import 'package:provider/provider.dart';
import 'package:examenp3_gersonlopez/screens/book_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookListProvider()),
      ],
      child: MaterialApp(
        title: 'LIBRERIA',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.library_books),
                SizedBox(width: 10),
                Text('LIBRERIA'),
              ],
            ),
          ),
          body: BookListScreen(),
        ),
      ),
    );
  }
}
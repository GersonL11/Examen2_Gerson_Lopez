import 'package:examenp3_gersonlopez/screens/book_listScreen.dart';
import 'package:flutter/material.dart';
import 'package:examenp3_gersonlopez/providers/book_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:examenp3_gersonlopez/screens/bookDetails_screen.dart';

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
        title: 'Stephen King Library',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Your App Title'),
          ),
          body:
              bookListScreen(), 
        ),
      ),
    );
  }
}
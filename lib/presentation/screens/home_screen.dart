import 'package:examenp3_gersonlopez/providers/respuesta_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final respuestaProvider = context.watch<RespuestaProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Libros'),
        backgroundColor: Colors.teal,
      ),
      body: respuestaProvider.respuestas.isNotEmpty
          ? ListView.builder(
              itemCount: respuestaProvider.respuestas.length,
              itemBuilder: (context, index) {
                final libro = respuestaProvider.respuestas[index];

                return Card(
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(libro.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Precio: ${libro.price}'),
                        Text('Categoría: ${libro.category}'),
                      ],
                    ),
                    onTap: () {
                      // Puedes implementar una acción al tocar el libro si es necesario
                    },
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}


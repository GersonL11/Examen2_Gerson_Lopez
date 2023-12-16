import 'dart:convert';
import 'package:examenp3_gersonlopez/domain/entities/respuesta.dart';
import 'package:http/http.dart' as http;

class ApiAnswer {
  final String baseUrl = "https://stephen-king-api.onrender.com"; 

  Future<List<Respuesta>> getRespuesta() async {
    final response = await http.get(Uri.parse('$baseUrl/api/books'));

    if (response.statusCode == 200) {
      
      final data = Respuesta.fromJson(response.body);
      List<Respuesta> respuestas = data.map((item) => Respuesta.fromJson(item)).toList();
      return respuestas;
    } else {
      throw Exception('Error al cargar los datos desde la API');
    }
  }
}

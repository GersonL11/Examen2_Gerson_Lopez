import 'package:flutter/material.dart';
import 'package:examenp3_gersonlopez/domain/entities/respuesta.dart';
import 'package:examenp3_gersonlopez/helper/answer.dart'; // Asegúrate de importar la clase ApiAnswer

class RespuestaProvider extends ChangeNotifier {
  final _apiAnswer = ApiAnswer();
  List<Respuesta> respuestas = [];

  Future<void> loadRespuesta() async {
    await Future.delayed(const Duration(seconds: 5));
    respuestas = await _apiAnswer.getRespuesta();
    notifyListeners();
  }
}

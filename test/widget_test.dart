import 'dart:convert';

import 'package:alquran_app/app/data/models/detail_surah.dart';
import 'package:alquran_app/app/data/models/surah.dart';
import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse('https://api.quran.sutanlab.id/surah');
  var response = await http.get(url);
  // print(response.body);
  List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
  // print(data[1]);
  Surah surahAnnas = Surah.fromJson(data[113]);
  Uri urlAnnas =
      Uri.parse('https://api.quran.sutanlab.id/surah/${surahAnnas.number}');
  var responseAnnas = await http.get(urlAnnas);
  Map<String, dynamic> dataAnnas =
      (json.decode(responseAnnas.body) as Map<String, dynamic>)["data"];

  DetailSurah annas = DetailSurah.fromJson(dataAnnas);
  print(annas.verses![0].text!.arab);
}

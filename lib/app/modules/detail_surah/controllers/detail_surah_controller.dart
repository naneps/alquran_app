import 'dart:convert';

import 'package:alquran_app/app/data/models/detail_surah.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailSurahController extends GetxController {
  Future<DetailSurah> getDetaukSurah(String id) async {
    Uri url = Uri.parse('https://api.quran.sutanlab.id/surah/$id');
    var response = await http.get(url);
    // print(response.body);
    Map<String, dynamic> data =
        (json.decode(response.body) as Map<String, dynamic>)["data"];
    var detail = DetailSurah.fromJson(data);
    // print("Data $data");
    return DetailSurah.fromJson(data);
  }
}

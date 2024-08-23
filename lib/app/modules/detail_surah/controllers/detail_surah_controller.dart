import 'dart:convert';

import '../../../data/models/detail_surah.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class DetailSurahController extends GetxController {
  Future<DetailSurah> getAllSurah(String id) async {
    Uri url = Uri.parse("https://api.quran.gading.dev/surah/$id");
    var response = await http.get(url);

    Map<String, dynamic> data =
        (jsonDecode(response.body) as Map<String, dynamic>)['data'];

    return DetailSurah.fromJson(data);
  }
}

import 'dart:convert';

import 'package:al_quran_app/app/data/models/detail_surah.dart';
import 'package:al_quran_app/app/data/models/surah.dart';
import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse("https://api.quran.gading.dev/surah");
  var response = await http.get(url);

  List data = (jsonDecode(response.body) as Map<String, dynamic>)['data'];

  // 1 - 114 -> index ke 0 - 113
  // print(data[0]);

  // data dari api ( raw data ) -> Model ( yang sudah disiapkan )
  Surah surahAnnas = Surah.fromJson(data[113]);
  // print(surahAnnas.name);
  // print(surahAnnas.toJson());
  // print(surahAnnas.name.long);

  Uri urlAnnas =
      Uri.parse("https://api.quran.gading.dev/surah/${surahAnnas.number}");
  var responseAnnas = await http.get(urlAnnas);

  Map<String, dynamic> dataAnnas =
      (jsonDecode(responseAnnas.body) as Map<String, dynamic>)['data'];
  DetailSurah detailSurahAnnas = DetailSurah.fromJson(dataAnnas);
  print(detailSurahAnnas.verses[0].text.arab);
}

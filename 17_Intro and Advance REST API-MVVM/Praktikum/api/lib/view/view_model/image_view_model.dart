// ignore_for_file: avoid_print

import 'package:api/services/services.dart';
import 'package:api/utils/url.dart';
import 'package:flutter/material.dart';

class MyImageProvider extends ChangeNotifier {
  final ApiService service = ApiService();
  final TextEditingController nama = TextEditingController();
  String _baseUrl = Url.urlImage;

  TextEditingController get getNama => nama;
  String _imageUrl = "";

  String get imageUrl => _imageUrl;

  set setNama(value) {
    nama.text = value;
    notifyListeners();
  }

  set baseUrl(String value) {
    _baseUrl = value;
    notifyListeners();
  }

  Future fetchData() async {
    if (nama.text.isNotEmpty) {
      final newUrl = "$_baseUrl?seed=${nama.text}";
      if (newUrl != _imageUrl) {
        _imageUrl = newUrl;
        notifyListeners();
      }

      final response = await service.fetchImage(imageUrl);
      if (response.statusCode == 200) {
        return _imageUrl;
      } else {
        print('Gagal mengambil data dari API');
      }
    }
  }
  Future fetchDataAndClearName() async {
    if (nama.text.isNotEmpty) {
      await fetchData();
      nama.clear();
    }
  }
}

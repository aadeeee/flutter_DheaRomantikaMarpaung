// ignore_for_file: deprecated_member_use, avoid_print

import 'package:api/models/user_model.dart';
import 'package:api/utils/url.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<UserModel> postData({
    required String name,
    required String job,
  }) async {
    try {
      Map<String, dynamic> requestBody = {
        'name': name,
        'job': job,
      };
      Response postResponse = await Dio().post(Url.urlUser, data: requestBody);

      if (postResponse.statusCode == 201) {
        print('Post success');
        print(postResponse.data);
        return UserModel.fromJson(postResponse.data);
      } else {
        print('Post error');
        throw Exception('Post error');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Post error');
    }
  }

  void updatePost(String title, String body) async {
    try {
      Map<String, dynamic> requestBody = {
        "id": 1,
        "title": title,
        "body": body,
        "userId": 1
      };

      Response response = await _dio.put(
        Url.user2,
        data: requestBody,
      );

      if (response.statusCode == 200) {
        print('Updated successfully');
        print(response.data);
      } else {
        print('Failed to update post. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<Response> fetchImage(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } catch (error) {
      throw Exception('Gagal mengambil data dari API: $error');
    }
  }

  Future<Response> fetchdata() async {
    try {
      final response = await _dio.get(Url.urltest);
      print(response);
      return response;
    } catch (error) {
      print('Terjadi kesalahan: $error');
      throw Exception('Gagal mengambil data dari API: $error');
    }
  }
}

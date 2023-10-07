// user_provider.dart

// ignore_for_file: deprecated_member_use, avoid_print

import 'package:api/models/user_model.dart';
import 'package:api/services/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final ApiService service = ApiService();

  UserModel? user;
  Future createNewUser({required String name, required String job}) async {
    try {
      notifyListeners();
      UserModel newUser = await service.postData(name: name, job: job);

      user = newUser;

      notifyListeners();
    } catch (e) {
      if (e is DioError) {
        int statusCode = e.response!.statusCode ?? -1;
        print('HTTP status code: $statusCode');
      }

      notifyListeners();
    }
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController get nameController => _nameController;
  TextEditingController get jobController => _jobController;

  TextEditingController get titleController => _titleController;
  TextEditingController get bodyController => _bodyController;

  GlobalKey<FormState> get key => _key;

  void updateData() {
    service.updatePost(titleController.text, bodyController.text);
  }

  String? _errorMessageName;

  String? get errorMessageName => _errorMessageName;
  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      _errorMessageName = 'Name is required';
    } else {
      _errorMessageName = null;
    }
    notifyListeners();
    return _errorMessageName;
  }

  String? _errorMessageJob;

  String? get errorMessageJob => _errorMessageJob;
  String? validateJob(String? name) {
    if (name == null || name.isEmpty) {
      _errorMessageJob = 'Job is required';
    } else {
      _errorMessageJob = null;
    }
    notifyListeners();
    return _errorMessageJob;
  }

  String? _errorMessageTitle;

  String? get errorMessageTitle => _errorMessageTitle;
  String? validateTitle(String? name) {
    if (name == null || name.isEmpty) {
      _errorMessageTitle = 'Title is required';
    } else {
      _errorMessageTitle = null;
    }
    notifyListeners();
    return _errorMessageTitle;
  }

  String? _errorMessageBody;

  String? get errorMessageBody => _errorMessageBody;
  String? validateBody(String? name) {
    if (name == null || name.isEmpty) {
      _errorMessageBody = 'Body is required';
    } else {
      _errorMessageBody = null;
    }
    notifyListeners();
    return _errorMessageBody;
  }
}

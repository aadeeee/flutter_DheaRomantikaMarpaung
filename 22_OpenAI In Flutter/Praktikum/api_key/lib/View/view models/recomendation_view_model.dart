// ignore_for_file: use_build_context_synchronously

import 'package:api_key/screens/recomendation_screen.dart';
import 'package:api_key/services/recomendation.dart';
import 'package:flutter/material.dart';

class RecomendationProvider extends ChangeNotifier {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _cameraController = TextEditingController();
  final TextEditingController _storageController = TextEditingController();

  GlobalKey<FormState> get formKey => _formkey;

  TextEditingController get budgetController => _budgetController;
  TextEditingController get cameraController => _cameraController;
  TextEditingController get storageController => _storageController;

  String? _errorMessageNumber;

  String? get errorMessageNumber => _errorMessageNumber;
  String? validateNumber(String? name) {
    if (name == null || name.isEmpty) {
      _errorMessageNumber = 'Invalid Number';
    } else {
      _errorMessageNumber = null;
    }
    notifyListeners();
    return _errorMessageNumber;
  }

  bool isLoading = false;
  late BuildContext context;

  void setContext(BuildContext ctx) {
    context = ctx;
  }

  Future<void> getRecomendations({
    required String budget,
    required String camera,
    required String storage,
    required BuildContext
        scaffoldContext, 
  }) async {
    isLoading = true;

    try {
      final result = await RecomendationService.getRecomendation(
        budget: budget,
        camera: camera,
        storage: storage,
      );
      Navigator.of(scaffoldContext).push(MaterialPageRoute(builder: (context) {
        return MyRecomendationScreen(getResponseData: result);
      }));
    } catch (e) {
      ScaffoldMessenger.of(scaffoldContext).showSnackBar(
          const SnackBar(content: Text("Failed to send a request")));
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

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

  late BuildContext context;

  void setContext(BuildContext ctx) {
    context = ctx;
  }

  bool isLoading = false;

  Future<void> getRecomendations() async {
    try {
      isLoading = true;
      notifyListeners();

      final result = await RecomendationService.getRecomendation(
          budget: _budgetController.text,
          camera: _cameraController.text,
          storage: _storageController.text);

      notifyListeners();

      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return MyRecomendationScreen(getResponseData: result);
      }));
    } catch (e) {
      const snackbar = SnackBar(content: Text("Failed to send a request"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

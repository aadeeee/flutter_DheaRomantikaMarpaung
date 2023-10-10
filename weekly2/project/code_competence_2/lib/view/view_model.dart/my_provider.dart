import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get messageController => _messageController;

  GlobalKey<FormState> get key => _key;

  bool capital(String text) {
    final words = text.split(' ');
    for (final word in words) {
      if (!RegExp(r'^[A-Z][a-zA-Z\s]*$').hasMatch(word)) {
        return false;
      }
    }
    return true;
  }

  //validasi nama
  String? _errorMessageName;

  String? get errorMessageName => _errorMessageName;
  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      _errorMessageName = 'Name is required';
    } else if (!capital(name)) {
      _errorMessageName =
          'Invalid, using capital';
    } else {
      _errorMessageName = null;
    }

    notifyListeners();

    return _errorMessageName;
  }

  //validasi email
  String? _errorMessageEmail;

  String? get errorMessageEmail => _errorMessageEmail;
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      _errorMessageEmail = 'Email is required';
    } else if (!email.contains('@')) {
      _errorMessageEmail = 'Invalid Email';
    } else {
      _errorMessageEmail = null;
    }

    notifyListeners();

    return _errorMessageEmail;
  }

  void showDialogContact(BuildContext context) {
    if (key.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    "Name: ${firstNameController.text} ${lastNameController.text}"),
                Text("Email: ${emailController.text}"),
                Text("Message: ${messageController.text}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        firstNameController.clear();
                        lastNameController.clear();
                        emailController.clear();
                        messageController.clear();
                        Navigator.of(context).pop();
                      },
                      child: const Text("Confirm"),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }
  }

  bool _isAppBarVisible = true;

  bool get isAppBarVisible => _isAppBarVisible;

  

  void updateAppBarVisibility(double scrollPixels) {
    if (scrollPixels > 50) {
      _isAppBarVisible = false;
    } else {
      _isAppBarVisible = true;
    }
    notifyListeners();
  }
}

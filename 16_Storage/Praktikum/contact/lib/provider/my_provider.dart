import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _editNameController = TextEditingController();
  final TextEditingController _editNumberController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final GlobalKey<FormState> _keyEdit = GlobalKey<FormState>();

  TextEditingController get nameController => _nameController;
  TextEditingController get numberController => _numberController;
  TextEditingController get editNameController => _editNameController;
  TextEditingController get editNumberController => _editNumberController;
  GlobalKey<FormState> get key => _key;
  GlobalKey<FormState> get keyedit => _keyEdit;

  bool capital(String text) {
    final words = text.split(' ');
    for (final word in words) {
      if (!RegExp(r'^[A-Z][a-zA-Z\s]*$').hasMatch(word)) {
        return false;
      }
    }
    return true;
  }
}

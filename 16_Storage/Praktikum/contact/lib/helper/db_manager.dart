import 'package:contact/helper/database_helper.dart';
import 'package:contact/model/contactmodel.dart';
import 'package:flutter/material.dart';

class DbManager extends ChangeNotifier {
  List<Contact> _contact = [];
  late DatabaseHelper _dbHelper;

  List<Contact> get contact => _contact;

  DbManager() {
    _dbHelper = DatabaseHelper();
    _getAllContacts();
  }

  Future<void> _getAllContacts() async {
    _contact = await _dbHelper.getContacts();
    notifyListeners();
  }

  Future<void> addContact(String name, String number) async {
    final newContact = Contact(nama: name, nomor: int.parse(number));
    await _dbHelper.insertContact(newContact);
    _getAllContacts();
  }

  Future<void> updateContact(int id, String name, String number) async {
    final updatedContact =
        Contact(id: id, nama: name, nomor: int.parse(number));
    await _dbHelper.updateContact(updatedContact);
    _getAllContacts();
  }

  Future<void> deleteContact(int id) async {
    await _dbHelper.deleteContact(id);
    _getAllContacts();
  }

  Future<List<Contact>> getAllContacts() async {
    return await _dbHelper.getContacts();
  }
}

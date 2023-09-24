import 'package:flutter/material.dart';
import 'package:gallery/model/contactmodel.dart';

class MyProvider extends ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _editNameController = TextEditingController();
  final TextEditingController _editNumberController = TextEditingController();

  TextEditingController get getNameController => _nameController;
  TextEditingController get getNumberController => _numberController;
  TextEditingController get geteditNameController => _editNameController;
  TextEditingController get geteditNumberController => _editNumberController;

  final List<Map<String, dynamic>> _listcontact = [
    {
      'name': 'Leane Graham',
      'number': "1-770-68031 x56442",
    },
    {
      'name': 'Ervin Howell',
      'number': "010-692-6593 x09125",
    },
    {
      'name': 'Clementine Bauch',
      'number': "1-463-123-4447",
    },
    {
      'name': 'Patricia Lebsack',
      'number': "493-170-9623 x156",
    },
    {
      'name': 'Chelsey Dietrich',
      'number': "(254)954-1289",
    },
    {
      'name': 'Mrs. Dennis Schullist',
      'number': "1-477-953-8478 x6430",
    },
    {
      'name': 'Kurtis Weissnat',
      'number': "210.067.6132",
    },
  ];

  List<Map<String, dynamic>> get listContact => _listcontact;
  final List<Contact> _account = [];

  List<Contact> get account => _account;

  void addContact(
      String name, String number, DateTime date, Color color, String fileName) {
    final newContact = Contact(name, number, date, color, fileName);

    _account.add(newContact);
    _listcontact.add({'name': name, 'number': number});
    notifyListeners();
  }

  void printAccount() {
    List<String> accountList =
        _account.map((contact) => contact.toString()).toList();
    // ignore: avoid_print
    print(accountList);
    notifyListeners();
  }

  void editContact(int index, String newName, String newNumber,
      DateTime newDate, Color newColor, String newFileName) {
    final listEditContact =
        Contact(newName, newNumber, newDate, newColor, newFileName);
    _account[index] = listEditContact;
    notifyListeners();
  }

  void deleteContact(int index) {
    if (index >= 0 && index < _account.length) {
      _account.removeAt(index);
      notifyListeners();
    }
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  bool capital(String text) {
    final words = text.split(' ');
    for (final word in words) {
      if (!RegExp(r'^[A-Z][a-zA-Z\s]*$').hasMatch(word)) {
        return false;
      }
    }
    return true;
  }

  final List<Map<String, dynamic>> _myLearn = [
    {"item": "Learn Flutter"},
    {
      "item": ["Learn ReactJS", "Learn VueJS"]
    },
    {"item": "Learn Tailwind CSS"},
    {"item": "Learn UI/UX"},
    {"item": "Learn Figma"},
    {"item": "Learn Digital Marketing"}
  ];

  List<Map<String, dynamic>> get listMyLearn => _myLearn;

  final List<String> images = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.jpg',
    'assets/images/img4.jpg',
    'assets/images/img5.jpg',
    'assets/images/img6.jpg',
    'assets/images/img7.jpg',
    'assets/images/img8.jpg',
    'assets/images/img9.jpg',
    'assets/images/img10.jpg',
    'assets/images/img11.jpg',
    'assets/images/img12.jpg',
    'assets/images/img13.jpg',
    'assets/images/img14.jpg',
    'assets/images/img15.jpg',
    'assets/images/img16.jpg',
    'assets/images/img17.jpg',
    'assets/images/img18.jpg',
    'assets/images/img19.jpg',
    'assets/images/img20.jpg',
  ];

  List<String> get listImage => images;
}

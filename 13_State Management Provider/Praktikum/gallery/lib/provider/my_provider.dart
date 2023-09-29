import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gallery/model/contactmodel.dart';
import 'package:open_file/open_file.dart';

class MyProvider extends ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _editNameController = TextEditingController();
  final TextEditingController _editNumberController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController get getNameController => _nameController;
  TextEditingController get getNumberController => _numberController;
  TextEditingController get geteditNameController => _editNameController;
  TextEditingController get geteditNumberController => _editNumberController;

  GlobalKey<FormState> get key => _key;

  DateTime dueDate = DateTime.now();
  final currentDate = DateTime.now();

  Color currentColor = Colors.orange;

  String selectedFileName = "";
  bool isFileSelected = false;
  String isfilePath = "";
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

  String? _errorMessagePhone;

  String? get errorMessagePhone => _errorMessagePhone;

  String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      _errorMessagePhone = 'Phone Number is required';
    } else if (!RegExp(r'^0[0-9]{7,14}$').hasMatch(phoneNumber)) {
      _errorMessagePhone =
          'Phone numbers must start with 0 and have 8-15 digits';
    } else {
      _errorMessagePhone = null;
    }

    notifyListeners();

    return _errorMessagePhone;
  }

  String? _errorMessageName;

  String? get errorMessageName => _errorMessageName;
  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      _errorMessageName = 'Name is required';
    } else if (name.split(' ').length < 2) {
      _errorMessageName = 'Name must have at least 2 words';
    } else if (!capital(name)) {
      _errorMessageName =
          'Words start with capital letters, no special characters.';
    } else {
      _errorMessageName = null;
    }

    notifyListeners();

    return _errorMessageName;
  }

  void onSubmitEdit(
      BuildContext context,
      int index,
      String previousName,
      String previousNumber,
      DateTime currentDate,
      Color currentColor,
      String selectedFileName) {
    final updatedName = geteditNameController.text;
    final updatedNumber = geteditNumberController.text;

    if ((updatedName.isNotEmpty || updatedNumber.isNotEmpty) &&
        (updatedName != previousName || updatedNumber != previousNumber)) {
      editContact(
        index,
        updatedName,
        updatedNumber,
        currentDate,
        currentColor,
        selectedFileName,
      );
    }
  }

  void onClosePage(BuildContext context) {
    Navigator.of(context).pop();
  }

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    selectedFileName = file.name;
    isfilePath = file.path ?? '';
    isFileSelected = true;

    notifyListeners();

    openFile(file);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  void updateColor(Color color) {
    currentColor = color;
    notifyListeners();
  }

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void updateSelectedDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

 void processForm(BuildContext context) {
  if (!isFileSelected) {
    showSnackbar(context, "Pick a File First");
    return;
  }

  if (_key.currentState!.validate()) {
    String name = getNameController.text;
    String number = getNumberController.text;

    addContact(
      name,
      number,
      dueDate,
      currentColor,
      selectedFileName,
    );

    dueDate = DateTime.now();
    getNameController.clear();
    getNumberController.clear();
    currentColor = currentColor;
    selectedFileName = "";
    isFileSelected = false;
    printAccount();
  }
}

  final List<Map<String, dynamic>> myLearn = [
    {"item": "Learn Flutter"},
    {
      "item": ["Learn ReactJS", "Learn VueJS"]
    },
    {"item": "Learn Tailwind CSS"},
    {"item": "Learn UI/UX"},
    {"item": "Learn Figma"},
    {"item": "Learn Digital Marketing"}
  ];

  List<Map<String, dynamic>> get listMyLearn => myLearn;

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

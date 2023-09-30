import 'package:gallery/model/contact_model.dart';

abstract class ContactListState {
  List<Contact> contact;
  ContactListState({required this.contact});
}

class ContactListAll extends ContactListState {
  ContactListAll({required List<Contact> contact}) : super(contact: contact);
}

class ContactListUpdated extends ContactListState {
  ContactListUpdated({required List<Contact> contact})
      : super(contact: contact);
}

class MyContactListState extends ContactListState {
  final bool isAccountListPrinted;

  MyContactListState(
    List<Contact> contact,
    this.isAccountListPrinted,
  ) : super(contact: contact);
}

class CapitalCheckResultState extends ContactListState {
  final bool isCapital;

  CapitalCheckResultState(
    this.isCapital,
  ) : super(contact: []);
}

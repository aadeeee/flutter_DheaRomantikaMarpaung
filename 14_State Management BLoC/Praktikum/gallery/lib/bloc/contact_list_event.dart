import 'package:gallery/model/contact_model.dart';

abstract class ContactListEvent {}

class AddContactEvent extends ContactListEvent {
  final Contact contact;
  AddContactEvent({required this.contact});
}

class EditContactEvent extends ContactListEvent {
  final int index;
  final String newName;
  final String newNumber;

  EditContactEvent({
    required this.index,
    required this.newName,
    required this.newNumber,
  });
}

class RemoveContactEvent extends ContactListEvent {
  final int index;
  RemoveContactEvent({required this.index});
}

class PrintAccountListEvent extends ContactListEvent {}






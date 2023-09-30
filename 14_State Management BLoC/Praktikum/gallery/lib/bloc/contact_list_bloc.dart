import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/bloc/contact_list_event.dart';
import 'package:gallery/bloc/contact_list_state.dart';
import 'package:gallery/model/contact_model.dart';

class ContactListBloc extends Bloc<ContactListEvent, ContactListState> {
  ContactListBloc() : super(ContactListAll(contact: [])) {
    on<AddContactEvent>(_addContact);
    on<EditContactEvent>(_editContact);
    on<RemoveContactEvent>(_removeContact);
    on<PrintAccountListEvent>(_printAccountList);
  }
  void _addContact(AddContactEvent event, Emitter<ContactListState> emit) {
    state.contact.add(event.contact);
    emit(ContactListUpdated(contact: state.contact));
  }

  void _removeContact(
      RemoveContactEvent event, Emitter<ContactListState> emit) {
    if (event.index >= 0 && event.index < state.contact.length) {
      final updatedList = List.of(state.contact);
      updatedList.removeAt(event.index);
      emit(ContactListUpdated(contact: updatedList));
    }
  }

  void _editContact(EditContactEvent event, Emitter<ContactListState> emit) {
    final updatedContact = Contact(event.newName, event.newNumber);

    final updatedList = List.of(state.contact);
    updatedList[event.index] = updatedContact;

    emit(ContactListUpdated(contact: updatedList));
  }

  void _printAccountList(
      PrintAccountListEvent event, Emitter<ContactListState> emit) {
    final List<String> accountList =
        state.contact.map((contact) => contact.toString()).toList();
    // ignore: avoid_print
    print(accountList);
  }

  String? validateInputPhone(String phone) {
    if (phone.isEmpty) {
      return 'Phone Number is required';
    } else if (!RegExp(r'^0[0-9]{7,14}$').hasMatch(phone)) {
      return 'Phone numbers must start with 0 and have 8-15 digits';
    }

    return null;
  }

  String? validateInputName(String name) {
    if (name.isEmpty) {
      return 'Name is required';
    }

    final words = name.split(' ');
    for (final word in words) {
      if (!RegExp(r'^[A-Z][a-zA-Z\s]*$').hasMatch(word)) {
        return 'Words must start with capital letters, no special characters.';
      }
    }

    if (words.length < 2) {
      return 'Name must have at least 2 words';
    }

    return null;
  }
}

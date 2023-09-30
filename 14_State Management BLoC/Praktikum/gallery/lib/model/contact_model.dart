class Contact {
  final String title;
  final String subtitle;

  Contact(
    this.title,
    this.subtitle,
  );

  @override
  String toString() {
    return '{name: $title, number: $subtitle}';
  }
}

class EditContactList {
  final int index;
  final String newName;
  final String newNumber;

  EditContactList({
    required this.index,
    required this.newName,
    required this.newNumber,
  });
}

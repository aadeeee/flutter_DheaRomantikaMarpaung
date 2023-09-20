import 'package:flutter/material.dart';

class Contact {
  final String title;
  final String subtitle;
  final DateTime date;
  final Color color;
  final String fileName;
  Contact(this.title, this.subtitle, this.date, this.color, this.fileName);
  @override
  String toString() {
    return '{name: $title, number: $subtitle, date: $date, color: $color, fileName: $fileName}';
  }
}

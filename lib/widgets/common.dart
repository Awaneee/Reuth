import 'package:flutter/material.dart';

Widget sectionTitle(String title) => Padding(
  padding: const EdgeInsets.symmetric(vertical: 8.0),
  child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
);

String dateStr(DateTime d) => "${d.day.toString().padLeft(2,'0')}/${d.month.toString().padLeft(2,'0')}/${d.year}";
String timeStr(DateTime d) => "${d.hour.toString().padLeft(2,'0')}:${d.minute.toString().padLeft(2,'0')}";

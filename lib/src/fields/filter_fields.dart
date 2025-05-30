import 'package:flutter/cupertino.dart';

enum FilterFieldType { text, dropdown, number, date }

class FilterFieldConfig {
  final String key;
  final String label;
  final FilterFieldType type;
  final TextEditingController? controller;
  final List<String>? options;

  FilterFieldConfig({
    required this.key,
    required this.label,
    required this.type,
    this.controller,
    this.options,
  });
}

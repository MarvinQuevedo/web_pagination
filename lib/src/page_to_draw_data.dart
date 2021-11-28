import 'package:flutter/material.dart';

class PageToDrawData {
  final List<int> list;
  final bool existLess;
  final bool existMore;

  PageToDrawData(
      {required this.list,
      required this.existLess,
      required this.existMore});
}

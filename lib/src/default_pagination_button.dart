import 'package:flutter/material.dart';
import 'button_theme.dart' as button;
import '../web_pagination.dart';

WebPaginationItemBuilder defaultPaginationButton =
    (context, page, type, onPressed) {
  Widget child = Text(
    "$page",
  );
  if (type == ButtonType.go_to_start) {
    child = Icon(Icons.keyboard_arrow_left);
  } else if (type == ButtonType.go_to_end) {
    child = Icon(Icons.keyboard_arrow_right);
  } else if (type == ButtonType.less) {
    child = Text("-1");
  } else if (type == ButtonType.plus) {
    child = Text("+1");
  }
  final bTheme = button.ButtonTheme.of(context)!;
  final color = bTheme.buttonColor ?? Theme.of(context).primaryColor;
  final textColor = bTheme.buttonTextColor ?? Colors.black;
  final disabled = bTheme.disableButton;
  print("textColor $textColor");
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: ElevatedButtonTheme(
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        child: child,
      ),
      data: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.resolveWith((states) => textColor),
          backgroundColor: MaterialStateProperty.resolveWith((states) => color),
        ),
      ),
    ),
  );
};

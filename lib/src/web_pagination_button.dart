import 'package:flutter/material.dart';
import '../src/web_pagination_item_builder.dart';
import '../src/web_pagination_widget.dart';

/// Only prepare the enviroment for add the button style and set the setttings
class WebPaginationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final WebPaginationItemBuilder webPaginationItemBuilder;
  final int page;
  const WebPaginationButton(
      {Key? key,
      required this.onPressed,
      required this.webPaginationItemBuilder,
      required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return webPaginationItemBuilder(
        context, page, ButtonType.normal, onPressed);
  }
}

import 'package:flutter/material.dart';
import 'package:web_pagination/src/web_pagination_widget.dart';

typedef WebPaginationItemBuilder = Widget Function(
    BuildContext context, int page, ButtonType type, VoidCallback onPressed);

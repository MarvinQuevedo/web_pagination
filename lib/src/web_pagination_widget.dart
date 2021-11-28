import 'package:flutter/material.dart';
import 'button_theme.dart' as button;
import 'package:web_pagination/src/page_to_draw_data.dart';
import 'package:web_pagination/src/web_pagination_button.dart';
import 'package:web_pagination/src/web_pagination_item_builder.dart';

import 'default_pagination_button.dart';

enum ButtonType { go_to_start, less, plus, go_to_end, normal }

class WebPaginationWidget extends StatelessWidget {
  final int actualPage;
  final int totalPages;
  final int countToDisplay;
  final WebPaginationItemBuilder? webPaginationItemBuilder;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final ValueChanged onPageChange;
  const WebPaginationWidget({
    Key? key,
    required this.actualPage,
    required this.totalPages,
    required this.countToDisplay,
    required this.onPageChange,
    this.buttonColor,
    this.buttonTextColor,
    this.webPaginationItemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return button.ButtonTheme(
        buttonTextColor: buttonTextColor,
        child: Builder(builder: (context) {
          final builder =
              this.webPaginationItemBuilder ?? defaultPaginationButton;
          final drawData = pagesToDraw(context);
          List<Widget> buttons = [
            if (drawData.existLess)
              Container(
                child: Text("..."),
                margin: EdgeInsets.symmetric(horizontal: 5),
              )
          ];
          buttons.addAll(drawData.list.map((e) {
            final child = WebPaginationButton(
                onPressed: () {
                  goToPage(context, e);
                },
                webPaginationItemBuilder: builder,
                page: e);
            if (e == actualPage) {
              return button.ButtonTheme(
                buttonColor: Colors.grey,
                buttonTextColor: buttonTextColor,
                disableButton: true,
                child: child,
              );
            }
            return child;
          }).toList());

          if (drawData.existMore) {
            buttons.add(Container(
              child: Text("..."),
              margin: EdgeInsets.symmetric(horizontal: 5),
            ));
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (totalPages > 1)
                builder(context, -1, ButtonType.go_to_start, () {
                  goToStart(context);
                }),
              if (totalPages > 1)
                builder(context, -1, ButtonType.less, () {
                  goToLess(context);
                }),
              for (var b in buttons) b,
              if (totalPages > 1)
                builder(context, -1, ButtonType.plus, () {
                  goToPlus(context);
                }),
              if (totalPages > 1)
                builder(context, -1, ButtonType.go_to_end, () {
                  goToEnd(context);
                }),
            ],
          );
        }),
        buttonColor: buttonColor);
  }

  PageToDrawData pagesToDraw(BuildContext context) {
    int firstPage = 1;
    int endPage = totalPages;

    final diff = (countToDisplay / 2).floor();
    print("diff = $diff");

    if ((actualPage - diff) > 1) {
      firstPage = actualPage - diff;
      print("(actualPage - diff) > 1");
    }
    if ((actualPage + diff) > totalPages) {
      endPage = totalPages;
      print("(actualPage + diff) > totalPages");
    } else {
      endPage = actualPage + diff;
      print("else");
    }
    if (endPage >= totalPages) {
      firstPage = totalPages - countToDisplay + 1;
    }
    print("firstPage = $firstPage");
    print("endPage = $endPage");

    List<int> list =
        List.generate(countToDisplay, (index) => index + firstPage).toList();
    if (list.length > totalPages) {
      list = List.generate(totalPages, (index) => index + 1);
    }
    print(list);
    return PageToDrawData(
        list: list, existLess: firstPage > 1, existMore: endPage < totalPages);
  }

  void goToStart(BuildContext context) {
    goToPage(context, 1);
  }

  void goToLess(BuildContext context) {
    goToPage(context, actualPage - 1);
  }

  void goToPlus(BuildContext context) {
    goToPage(context, actualPage + 1);
  }

  void goToEnd(BuildContext context) {
    goToPage(context, totalPages);
  }

  void goToPage(BuildContext context, int page) {
    if (page > totalPages) {
      page = totalPages;
    } else if (page < 1) {
      page = 1;
    }
    onPageChange(page);
  }
}

# web_pagination

A new Flutter package project.

## Getting Started

This package help to create a web pagination easily
```dart
WebPaginationWidget(
              actualPage: actualPage,
              countToDisplay: 10,
              totalPages: 1,
              buttonColor: Colors.black,
              buttonTextColor: Colors.white,
              onPageChange: (page) {
                setState(() {
                  actualPage = page;
                });
              },
            )
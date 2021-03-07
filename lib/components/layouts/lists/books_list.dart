import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:molteo_books/components/fragments/indicators/app_loader.dart';
import 'package:molteo_books/components/fragments/list_items/book_list_tile.dart';
import 'package:molteo_books/components/fragments/spacers/mb_sized_box.dart';
import 'package:molteo_books/components/fragments/state/mb_empty_state.dart';
import 'package:molteo_books/components/fragments/state/mb_error_state.dart';
import 'package:molteo_books/models/http/response/library_response_models.dart';
import 'package:molteo_books/state/library_state.dart';
import 'package:molteo_books/style/input_styles.dart';
import 'package:molteo_books/utils/dimensions.dart';
import 'package:molteo_books/utils/helpers.dart';
import 'package:provider/provider.dart';

class BooksListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BooksListViewState();
}

class _BooksListViewState extends State<BooksListView> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final scaler = MbScaleUtil(context);
    final model = context.watch<LibraryState>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const MbSizedBox(height: 1),
        Padding(
          padding: scaler.insets.symmetric(horizontal: 5),
          child: TextFormField(
            controller: controller,
            decoration: grayInput.copyWith(hintText: "Search books"),
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (String text) {
              model.getBooks(query: text);
            },
          ),
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: model.booksRef,
            builder: (context, Future<LibraryResponse> future, _) {
              return FutureBuilder(
                future: future,
                builder: (context, AsyncSnapshot<LibraryResponse> task) {
                  if (task.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Apploader(),
                    );
                  }
                  if (task.hasError) {
                    return Center(
                      child: MbErrorState(
                        errorMessage: parseError(
                          task.error,
                          "An unexpected error occured when fetching books list",
                          context,
                        ),
                        onRetry: () {
                          model.getBooks(query: controller.text);
                        },
                      ),
                    );
                  }
                  if (!(task.hasData) || (task?.data?.books?.isEmpty ?? true)) {
                    return Center(
                      child: MbEmptyState(
                        message: "No books were found at this time",
                        subMessage:
                            "No books could be fetched, if you made a search please try a diferent term",
                        onRetry: () {
                          model.getBooks(query: controller.text);
                        },
                      ),
                    );
                  }
                  return RefreshIndicator(
                    child: ListView.separated(
                      padding: scaler.insets.symmetric(
                        vertical: 2,
                        horizontal: 5,
                      ),
                      separatorBuilder: (_, __) => Divider(),
                      itemBuilder: (_, idx) {
                        final book = task?.data?.books[idx];
                        return BookListTile(
                          book,
                          onTap: () {
                            model.getBookDetail(book, context: context, screenType: scaler.sizer.screenType);
                          },
                        );
                      },
                      itemCount: task?.data?.books?.length ?? 0,
                    ),
                    onRefresh: () async {
                      model.getBooks();
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
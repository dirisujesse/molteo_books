import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:molteo_books/components/fragments/indicators/app_loader.dart';
import 'package:molteo_books/components/fragments/spacers/mb_sized_box.dart';
import 'package:molteo_books/components/fragments/state/mb_empty_state.dart';
import 'package:molteo_books/components/fragments/state/mb_error_state.dart';
import 'package:molteo_books/components/layouts/book_detail_layout.dart';
import 'package:molteo_books/components/typography/app_text.dart';
import 'package:molteo_books/models/http/response/library_response_models.dart';
import 'package:molteo_books/state/library_state.dart';
import 'package:molteo_books/style/colors.dart';
import 'package:molteo_books/style/text_styles.dart';
import 'package:molteo_books/utils/dimensions.dart';
import 'package:molteo_books/utils/helpers.dart';
import 'package:provider/provider.dart';

class LibraryDetailPage extends StatelessWidget {
  const LibraryDetailPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailView(),
    );
  }
}

class BookDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<LibraryState>();
    final scaler = MbScaleUtil(context);
    return ValueListenableBuilder(
      valueListenable: model.selectedBook,
      builder: (context, Book book, child) {
        if (book == null) {
          return child;
        }
        return NestedScrollView(
          headerSliverBuilder: (_, __) {
            return [
              SliverAppBar(
                title: MbText(
                  book?.title,
                  style: MbTextStyle.black,
                ),
              )
            ];
          },
          body: Container(
            padding: scaler.insets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: "Image::${book.isbn13}",
                    child: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(book.image),
                      radius: 70,
                      backgroundColor: MbColors.purple,
                    ),
                  ),
                ),
                const MbSizedBox(height: 1),
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: model.bookRef,
                    builder: (context, Future<BookDetail> future, _) {
                      return FutureBuilder(
                        future: future,
                        builder: (context, AsyncSnapshot<BookDetail> task) {
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
                                  model.getBookDetail(book);
                                },
                              ),
                            );
                          }
                          if (!(task.hasData)) {
                            return Center(
                              child: MbEmptyState(
                                message:
                                    "We could not fetch details for the selected books",
                                subMessage:
                                    "A search for details for the selected book failed",
                                onRetry: () {
                                  model.getBookDetail(book);
                                },
                              ),
                            );
                          }
                          return BookDetails(task?.data);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Center(
        child: MbEmptyState(
          message: "No Book Selected",
          subMessage:
              "To view details for a book please select one from the sidebar",
        ),
      ),
    );
  }
}

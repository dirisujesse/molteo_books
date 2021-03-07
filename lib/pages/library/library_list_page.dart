import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:molteo_books/components/layouts/lists/books_list.dart';
import 'package:molteo_books/components/typography/app_text.dart';
import 'package:molteo_books/models/enums/screen_type.dart';
import 'package:molteo_books/pages/library/library_detail_page.dart';
import 'package:molteo_books/style/style.dart';
import 'package:molteo_books/utils/dimensions.dart';

class LibraryHomePage extends StatelessWidget {
  const LibraryHomePage();

  @override
  Widget build(BuildContext context) {
    final scaler = MbScaleUtil(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MbColors.purple,
        title: MbText(
          "Molteo Books",
          style: MbTextStyle.black.copyWith(
            color: MbColors.white,
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          if (scaler.sizer.screenType == ScreenType.MOBILE)
            return BooksListView();
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: double.infinity,
                width: scaler.sizer.setHeight(40),
                child: BooksListView(),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: MbColors.grey
                    )
                  )
                ),
              ),
              const SizedBox(),
              Expanded(
                child: LibraryDetailPage(),
              )
            ],
          );
        },
      ),
    );
  }
}

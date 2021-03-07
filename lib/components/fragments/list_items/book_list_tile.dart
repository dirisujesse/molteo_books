import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:molteo_books/components/fragments/spacers/mb_sized_box.dart';
import 'package:molteo_books/components/typography/app_text.dart';
import 'package:molteo_books/models/http/response/library_response_models.dart';
import 'package:molteo_books/style/style.dart';
import 'package:molteo_books/utils/dimensions.dart';
import 'package:molteo_books/utils/typedefs.dart';

class BookListTile extends StatelessWidget {
  final Book book;
  final OnPressed onTap;

  BookListTile(this.book, {this.onTap});

  @override
  Widget build(BuildContext context) {
    final scaler = MbScaleUtil(context);
    return InkWell(
      onTap: onTap,
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(.3),
          2: FlexColumnWidth(7),
        },
        children: [
          TableRow(
            children: [
              Hero(
                tag: "Image::${book.isbn13}",
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: scaler.sizer.setHeight(15),
                    minHeight: scaler.sizer.setHeight(10),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        book.image,
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                    borderRadius: BorderRadius.circular(
                      scaler.fontSizer.sp(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: "Title::${book.isbn13}",
                    child: MbText(
                      book?.title ?? "",
                      style: MbTextStyle.black.copyWith(
                        fontSize: 45,
                      ),
                    ),
                  ),
                  MbText(book?.description ?? ""),
                  const MbSizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MbText(
                        book?.price ?? "",
                        style: MbTextStyle.bold.copyWith(
                          color: MbColors.red,
                        ),
                      ),
                      Spacer(),
                      MbText(
                        "#${book?.isbn13 ?? ""}",
                        style: MbTextStyle.bold.copyWith(
                          color: MbColors.purple,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

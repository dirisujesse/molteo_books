import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:molteo_books/components/fragments/cards/book_feature_card.dart';
import 'package:molteo_books/components/fragments/spacers/mb_sized_box.dart';
import 'package:molteo_books/components/typography/app_text.dart';
import 'package:molteo_books/models/http/response/library_response_models.dart';
import 'package:molteo_books/style/colors.dart';
import 'package:molteo_books/style/text_styles.dart';
import 'package:molteo_books/utils/dimensions.dart';

class BookDetails extends StatelessWidget {
  final BookDetail details;

  BookDetails(this.details);

  @override
  Widget build(BuildContext context) {
    final scaler = MbScaleUtil(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: scaler.insets.symmetric(vertical: .3, horizontal: 3),
              decoration: BoxDecoration(
                color: MbColors.black,
                borderRadius: BorderRadius.circular(
                  scaler.fontSizer.sp(100),
                ),
              ),
              child: MbText(
                details?.authors,
                textAlign: TextAlign.center,
                style: MbTextStyle.bold.copyWith(
                  color: MbColors.white,
                ),
              ),
            ),
          ),
          const MbSizedBox(height: 3),
          Wrap(
            spacing: scaler.sizer.setWidth(3),
            runSpacing: scaler.sizer.setWidth(2),
            alignment: WrapAlignment.center,
            children: [
              BookFeatureCard(
                icon: Icon(
                  Icons.star_outline_rounded,
                  size: 20,
                ),
                description: details?.rating ?? "",
              ),
              BookFeatureCard(
                icon: Icon(
                  Icons.edit_outlined,
                  size: 20,
                ),
                description: details?.language ?? "",
              ),
              BookFeatureCard(
                icon: Icon(
                  Icons.insert_drive_file_outlined,
                  size: 20,
                ),
                description: details?.pages ?? "",
              ),
              BookFeatureCard(
                icon: Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                ),
                description: details?.year ?? "",
              ),
            ],
          ),
          const MbSizedBox(height: 3),
          MbText(details?.desc, textAlign: TextAlign.justify,),
        ],
      ),
    );
  }
}

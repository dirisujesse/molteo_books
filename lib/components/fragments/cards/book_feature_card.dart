import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:molteo_books/components/fragments/spacers/mb_sized_box.dart';
import 'package:molteo_books/components/typography/app_text.dart';
import 'package:molteo_books/style/colors.dart';
import 'package:molteo_books/style/text_styles.dart';
import 'package:molteo_books/utils/dimensions.dart';

class BookFeatureCard extends StatelessWidget {
  final Icon icon;
  final String description;

  BookFeatureCard({
    @required this.icon,
    @required this.description,
  })  : assert(icon != null),
        assert(description != null);

  @override
  Widget build(BuildContext context) {
    final scaler = MbScaleUtil(context);
    return Container(
      padding: scaler.insets.symmetric(vertical: .3, horizontal: 3),
      decoration: BoxDecoration(
        color: MbColors.grey,
        borderRadius: BorderRadius.circular(
          scaler.fontSizer.sp(100),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          const MbSizedBox(width: 1),
          MbText(
            description,
            style: MbTextStyle.bold,
          ),
        ],
      ),
    );
  }
}
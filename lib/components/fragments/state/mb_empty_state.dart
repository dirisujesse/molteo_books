import 'package:molteo_books/components/fragments/buttons/mb_button.dart';
import 'package:molteo_books/components/fragments/spacers/mb_sized_box.dart';
import 'package:molteo_books/components/typography/app_text.dart';
import 'package:molteo_books/style/colors.dart';
import 'package:molteo_books/style/style.dart';
import 'package:molteo_books/utils/dimensions.dart';
import 'package:molteo_books/utils/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MbEmptyState extends StatelessWidget {
  final String message;
  final String subMessage;
  final OnPressed onRetry;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  MbEmptyState({
    @required this.message,
    this.onRetry,
    this.subMessage,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  })  : assert(message != null);
  @override
  Widget build(BuildContext context) {
    final scaler = MbScaleUtil(context);
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        Icon(
          Icons.workspaces_outline,
          size: scaler.fontSizer.sp(200),
        ),
        const MbSizedBox(height: .5),
        Flexible(
          child: MbText(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight:
                  subMessage != null ? FontWeight.bold : FontWeight.w300,
            ),
          ),
        ),
        if (subMessage != null) const MbSizedBox(height: .5),
        if (subMessage != null)
          Flexible(
            child: MbText(
              subMessage,
              textAlign: TextAlign.center,
              style: MbTextStyle.light,
            ),
          ),
        if (onRetry != null)
        Flexible(
          child: FittedBox(
            child: MbButton(
            text: "Refresh",
            textColor: MbColors.green,
            color: MbColors.transparent,
            onPressed: onRetry,
          ),
          ),
        ),
      ],
    );
  }
}

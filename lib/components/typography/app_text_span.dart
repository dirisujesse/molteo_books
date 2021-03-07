import 'package:flutter/material.dart';
import 'package:molteo_books/style/text_styles.dart';
import 'package:molteo_books/utils/dimensions.dart';
import 'package:molteo_books/style/colors.dart';

class MbTextSpan extends StatelessWidget {
  final List<String> messages;
  final double fontSize;
  final TextAlign textAlign;
  final bool forceLineBreak;

  const MbTextSpan({
    @required this.messages,
    this.textAlign = TextAlign.left,
    this.fontSize = 45,
    this.forceLineBreak = true,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = MbScaleUtil(context);
    return RichText(
      text: TextSpan(
        children: messages.map(
          (message) {
            final embolden = message.startsWith("(BOLD)");
            if (embolden) {
              message = message.substring(6);
            }
            final appendage = !forceLineBreak
                ? ""
                : message == messages.last
                    ? ""
                    : "\n\n";
            return TextSpan(
              text: "$message$appendage",
              style: embolden
                  ? MbTextStyle.medium.copyWith(
                      color: MbColors.black,
                      fontSize: scaler.fontSizer.sp(fontSize),
                      fontWeight: FontWeight.w900,
                    )
                  : null,
            );
          },
        ).toList(),
        style: MbTextStyle.medium.copyWith(
          color: MbColors.black,
          fontSize: scaler.fontSizer.sp(fontSize),
          fontWeight: FontWeight.w600,
        ),
      ),
      textAlign: textAlign,
    );
  }
}

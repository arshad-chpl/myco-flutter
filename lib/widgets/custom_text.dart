import 'package:flutter/material.dart';
import 'package:myco_flutter/core/theme/app_theme.dart';
import 'package:myco_flutter/core/utils/language_manager.dart';
import 'package:myco_flutter/core/utils/util.dart';

// class CustomText extends StatelessWidget {
//   final String text;
//   final bool isKey;
//   final double fontSize;
//   final FontWeight fontWeight;
//   final Color? color;
//   final TextAlign? textAlign;
//   final int? maxLines;
//   final TextOverflow? overflow;
//   final TextDecoration? decoration;
//   final Color? decorationColor;
//   final FontStyle? fontStyle;
//   final bool highlight;
//   final Color? highlightBackgroundColor;

//   const CustomText(
//     this.text, {
//     super.key,
//     this.isKey = true,
//     this.fontSize = 16,
//     this.fontWeight = FontWeight.w400,
//     this.color,
//     this.textAlign,
//     this.maxLines,
//     this.overflow,
//     this.decoration,
//     this.decorationColor,
//     this.fontStyle,
//     this.highlight = false,
//     this.highlightBackgroundColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final baseColor = color ?? AppTheme.getColor(context).onSurface;

//     // Create Paint only if highlight is true
//     final Paint? backgroundPaint = highlight
//         ? (Paint()
//             ..color =
//                 highlightBackgroundColor ??
//                 AppTheme.getColor(context).primary.withOpacity(0.2))
//         : null;

//     return Text(
//       isKey ? LanguageManager().get(text) : text,
//       textAlign: textAlign,
//       maxLines: maxLines,
//       overflow: overflow,
//       style: TextStyle(
//         fontFamily: Util.getFontFamily(fontWeight),
//         fontSize: fontSize,
//         color: baseColor,
//         decoration: decoration,
//         decorationColor: decorationColor,
//         fontStyle: fontStyle,
//         background: backgroundPaint,
//       ),
//     );
//   }
// }



/// A custom text widget that supports optional language translation,
/// styling, and keyword highlighting with a background color.
class CustomText extends StatelessWidget {
  final String text; // The main text to display.
  final bool isKey; // Whether to translate the text using LanguageManager.
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final FontStyle? fontStyle;

  // Highlighting options
  final bool isHighlight; // Whether to enable highlighting.
  final String? highlightText; // The substring to highlight.
  final Color?
  highlightBackgroundColor; // Background color of highlighted text.
  final List<Shadow> textShadows; // Optional text shadows. 

  const CustomText(
    this.text, {
    super.key,
    this.isKey = true,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.decorationColor,
    this.fontStyle,
    this.isHighlight = false,
    this.highlightText,
    this.highlightBackgroundColor,
    this.textShadows = const [],
  });

  @override
  Widget build(BuildContext context) {
    // Get the display text, optionally translated if isKey is true.
    final displayText = isKey ? LanguageManager().get(text) : text;

    // If highlighting is disabled or no keyword is provided, return normal Text.
    if (!isHighlight || highlightText == null || highlightText!.isEmpty) {
      return Text(
        displayText,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: _defaultStyle(context),
      );
    }

    final spans = <TextSpan>[]; // Holds the styled parts of the final text.
    final lowerText = displayText.toLowerCase(); // Case-insensitive search.
    final lowerQuery = highlightText!.toLowerCase();

    int start = 0; // Start index for search iteration.

    // Loop through all matching parts of the highlight text.
    while (true) {
      final matchIndex = lowerText.indexOf(lowerQuery, start);

      if (matchIndex == -1) {
        // No more matches found; add remaining text and break.
        spans.add(
          TextSpan(
            text: displayText.substring(start),
            style: _defaultStyle(context),
          ),
        );
        break;
      }

      // Add normal (non-highlighted) text before the match.
      if (matchIndex > start) {
        spans.add(
          TextSpan(
            text: displayText.substring(start, matchIndex),
            style: _defaultStyle(context),
          ),
        );
      }

      // Add the matched text with highlighted background.
      spans.add(
        TextSpan(
          text: displayText.substring(
            matchIndex,
            matchIndex + lowerQuery.length,
          ),
          style: TextStyle(
            background: Paint()
              ..color =
                  highlightBackgroundColor ??
                  AppTheme.getColor(context).primary.withOpacity(0.2),
          ),
        ),
      );

      // Move the cursor past the current match.
      start = matchIndex + lowerQuery.length;
    }

    // Return a RichText widget that combines all spans (normal + highlighted).
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.clip,
      // ignore: deprecated_member_use
      textScaleFactor: 1.0, // Keeps consistent text size
      text: TextSpan(children: spans, style: _defaultStyle(context)),
    );
  }

  /// Returns the default text style used when not highlighting.
  TextStyle _defaultStyle(BuildContext context) => TextStyle(
    fontFamily: Util.getFontFamily(fontWeight),
    fontSize: fontSize,
    color: color ?? AppTheme.getColor(context).onSurface,
    decoration: decoration,
    decorationColor: decorationColor,
    fontStyle: fontStyle,
    shadows: textShadows
  );
}

import 'package:flutter/material.dart';

class MainTextWidget extends StatelessWidget {
  final String text;
  final TextStyleType styleType;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color? color;
  final bool softWrap;

  const MainTextWidget({
    super.key,
    required this.text,
    this.styleType = TextStyleType.bodyMedium,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.color,
    this.softWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = _getTextStyle(context);

    return Text(
      text,
      style: color != null ? textStyle.copyWith(color: color) : textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
    );
  }

  TextStyle _getTextStyle(BuildContext context) {
    switch (styleType) {
      case TextStyleType.headlineLarge:
        return Theme.of(context).textTheme.headlineLarge ?? const TextStyle();
      case TextStyleType.headlineMedium:
        return Theme.of(context).textTheme.headlineMedium ?? const TextStyle();
      case TextStyleType.headlineSmall:
        return Theme.of(context).textTheme.headlineSmall ?? const TextStyle();
      case TextStyleType.titleLarge:
        return Theme.of(context).textTheme.titleLarge ?? const TextStyle();
      case TextStyleType.titleMedium:
        return Theme.of(context).textTheme.titleMedium ?? const TextStyle();
      case TextStyleType.titleSmall:
        return Theme.of(context).textTheme.titleSmall ?? const TextStyle();
      case TextStyleType.bodyLarge:
        return Theme.of(context).textTheme.bodyLarge ?? const TextStyle();
      case TextStyleType.bodyMedium:
        return Theme.of(context).textTheme.bodyMedium ?? const TextStyle();
      case TextStyleType.bodySmall:
        return Theme.of(context).textTheme.bodySmall ?? const TextStyle();
      case TextStyleType.labelLarge:
        return Theme.of(context).textTheme.labelLarge ?? const TextStyle();
      case TextStyleType.labelMedium:
        return Theme.of(context).textTheme.labelMedium ?? const TextStyle();
      case TextStyleType.labelSmall:
        return Theme.of(context).textTheme.labelSmall ?? const TextStyle();
      case TextStyleType.displayLarge:
        return Theme.of(context).textTheme.displayLarge ?? const TextStyle();
      case TextStyleType.displayMedium:
        return Theme.of(context).textTheme.displayMedium ?? const TextStyle();
      case TextStyleType.displaySmall:
        return Theme.of(context).textTheme.displaySmall ?? const TextStyle();
      // default:
      //   return Theme.of(context).textTheme.bodyMedium ?? const TextStyle();
    }
  }
}

enum TextStyleType {
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
  displayLarge,
  displayMedium,
  displaySmall,
}

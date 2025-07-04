import 'package:flutter/material.dart';

class RequiredTextLabel extends StatelessWidget {
  final String text;
  final bool isRequired;
  final TextStyle? style;
  final double? spacing;

  const RequiredTextLabel({
    super.key,
    required this.text,
    this.isRequired = false,
    this.style,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) => RichText(
    text: TextSpan(
      text: text,
      style:
          style ??
          Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
      children: isRequired
          ? [
              WidgetSpan(
                child: Padding(
                  padding: EdgeInsets.only(left: spacing ?? 4),
                  child: const Text(
                    '*',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]
          : [],
    ),
  );
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatelessWidget {
  final String text;
  final bool isExpanded;
  final VoidCallback onToggle;

  const ExpandableText({
    super.key,
    required this.text,
    required this.isExpanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final showMore = text.length > 80;

    return Text.rich(
      TextSpan(
        text: isExpanded || !showMore ? text : '${text.substring(0, 80)}...',
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
        children:
            showMore
                ? [
                  TextSpan(
                    text: isExpanded ? ' Gizle' : ' Daha Fazlası',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 13,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = onToggle,
                  ),
                ]
                : [],
      ),
    );
  }
}

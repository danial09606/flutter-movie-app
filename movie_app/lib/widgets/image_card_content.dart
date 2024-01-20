import 'package:flutter/material.dart';

class ImageCardContent extends StatelessWidget {
  const ImageCardContent({
    super.key,
    this.contentPadding,
    this.tags,
    this.title,
    this.description,
    this.footer,
    this.tagSpacing,
    this.tagRunSpacing,
  });

  final EdgeInsetsGeometry? contentPadding;
  final List<Widget>? tags;
  final double? tagSpacing;
  final double? tagRunSpacing;

  final Widget? title;
  final Widget? description;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: contentPadding ??
          const EdgeInsets.only(top: 5, bottom: 5, left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (tags != null)
            Wrap(
              spacing: tagSpacing ?? 12,
              runSpacing: tagRunSpacing ?? 10,
              children: tags!,
            ),
          if (title != null || description != null)
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) title!,
                  if (title != null && description != null)
                    const SizedBox(
                      height: 1,
                    ),
                  if (description != null) description!,
                ],
              ),
            ),
          if (footer != null)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: footer!,
            ),
        ],
      ),
    );
  }
}

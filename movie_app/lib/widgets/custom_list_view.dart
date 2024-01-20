import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget? leading;
  final Text? title;
  final Text? subTitle;
  final Widget? trailing;
  final Color? tileColor;
  final double? height;

  const CustomListTile({
    super.key,
    this.leading,
    this.title,
    this.subTitle,
    this.trailing,
    this.tileColor,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: tileColor,
      child: InkWell(
        child: SizedBox(
          height: height,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: leading,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title ?? const SizedBox(),
                    const SizedBox(height: 2),
                    subTitle ?? const SizedBox(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: trailing,
              )
            ],
          ),
        ),
      ),
    );
  }
}

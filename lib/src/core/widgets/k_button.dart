import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:movie_app_demo/src/core/utils/color.dart';

class KButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;
  final double? width;
  final double? height;
  const KButton({
    super.key,
    this.onTap,
    this.text,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 60,
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        width: width ?? context.width,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text ?? "",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}

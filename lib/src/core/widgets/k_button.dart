import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:movie_app_demo/src/core/utils/color.dart';

class KButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final double? width;
  final double? height;
  final Color? bgColor;
  const KButton({
    super.key,
    this.onTap,
    this.child,
    this.width,
    this.height,
    this.bgColor,
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
          color:bgColor?? kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}

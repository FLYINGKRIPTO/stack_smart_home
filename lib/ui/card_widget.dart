import 'package:flutter/material.dart';
import 'package:stack_smart_home/utils/color.dart';

class CardWidget extends StatelessWidget {
  final Widget? childWidget;
  final bool isTransparent;

  const CardWidget({Key? key, this.childWidget, this.isTransparent = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          child: childWidget,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(24.0),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 2),
                blurRadius: 12,
                color: Color.fromRGBO(0, 0, 0, 0.16),
              ),
            ],
            color: isTransparent
                ? BrandColor.white.withOpacity(0.3)
                : BrandColor.white,
            border: Border.all(
              color: BrandColor.white.withOpacity(0.2),
            ),
          ),
        ),
      ],
    );
  }
}

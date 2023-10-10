import 'package:flutter/material.dart';

enum ScreenMode {
  mobile,
  tablet,
  desktop,
}

class ScreenView extends StatelessWidget {
  const ScreenView(
      {super.key,
      required this.primaryChild,
      required this.child, required this.screenMode});
  final Widget primaryChild;
  final Widget child;
  final ScreenMode screenMode;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    final double? primaryHeight;
  final double height;
  final double viewPort;

    switch (screenMode) {
      case ScreenMode.mobile:
      viewPort = 400;
        primaryHeight = 850;
        height = 3620;
        break;
        case ScreenMode.tablet:
        viewPort = 700;
        primaryHeight = 600;
        height = 2910;
        break;
        case ScreenMode.desktop:
        viewPort = 1060;
         primaryHeight = null;
        height = 800;
        break;
    }

    return Column(
      children: [
        Container(
          width: viewPort,
          height: primaryHeight,
          padding: const EdgeInsets.only(top: 40),
          child: primaryChild,
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 100),
              height: height,
              color: colorScheme.surface.withOpacity(0.5),
            ),
            Container(
              width: viewPort,
              padding: const EdgeInsets.symmetric(vertical: 20),
              height: height,
              child: child,
            ),
          ],
        ),
      ],
    );
  }
}

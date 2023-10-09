import 'package:flutter/material.dart';

class AvatarView extends StatelessWidget {
  const AvatarView({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(360),
              color: colorScheme.surface.withOpacity(0.5),
            ),
          ),
        ),
        Image.asset(
          'images/profile-nobg-cropped.png',
          width: 320,
        ),
      ],
    );
  }
}
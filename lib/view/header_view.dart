import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:raihanrabbani001/viewmodel/theme_viewmodel.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    final FlutterLocalization localization = FlutterLocalization.instance;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () => context.read<ThemeViewModel>().switchColor(),
                icon: Icon(
                  Icons.color_lens_rounded,
                  color: colorScheme.primary,
                )),
            IconButton(
                onPressed: () => context.read<ThemeViewModel>().switchMode(),
                icon: Icon((Theme.of(context).brightness == Brightness.dark)
                    ? Icons.light_mode_rounded
                    : Icons.dark_mode_rounded)),
          ],
        ),
        IconButton(
            onPressed: () => (localization.currentLocale.toString() == 'en_US')
                ? localization.translate('id')
                : localization.translate('en'),
            icon: const Icon(Icons.language_rounded)),
      ],
    );
  }
}
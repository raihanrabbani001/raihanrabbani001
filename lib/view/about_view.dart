import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:raihanrabbani001/app_locale.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key, required this.bodyLargeLabel, this.flex = 0});
  final TextStyle bodyLargeLabel;
  final int flex;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;

    SizedBox badge(String number, String label) {
      return SizedBox(
        width: 143,
        child: Row(
          children: [
            Text(
              number,
              style:
                  textTheme.displayLarge!.copyWith(color: colorScheme.primary),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              label,
              style: textTheme.labelMedium!
                  .copyWith(color: colorScheme.onSurface.withOpacity(0.8)),
            )),
          ],
        ),
      );
    }

    return Expanded(
      flex: flex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocale.nav1.getString(context),
            style: bodyLargeLabel,
          ),
          RichText(
            text: TextSpan(
              style: textTheme.displaySmall!.copyWith(fontSize: 16, height: 1.5),
              children: <TextSpan>[
                TextSpan(
                  text: AppLocale.introduction1.getString(context),
                ),
                TextSpan(
                  text: AppLocale.highlight1.getString(context),
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextSpan(
                  text: AppLocale.introduction2.getString(context),
                ),
                TextSpan(
                  text: AppLocale.highlight2.getString(context),
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
    
            child: Wrap(
              children: [
                badge('4', AppLocale.badge1.getString(context)),
                badge('2', AppLocale.badge2.getString(context)),
                badge('13', AppLocale.badge3.getString(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

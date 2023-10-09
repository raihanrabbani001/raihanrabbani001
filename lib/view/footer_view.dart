import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:raihanrabbani001/app_locale.dart';

class FooterView extends StatelessWidget {
  const FooterView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            AppLocale.footer1.getString(context),
            style: textTheme.labelSmall!.copyWith(height: 2),
          ),
          RichText(
            text: TextSpan(
              style: textTheme.labelSmall,
              children: [
                TextSpan(
                  text: AppLocale.footer2.getString(context),
                ),
                const TextSpan(
                  text: "❤️",
                  style: TextStyle(color: Colors.red),
                ),
                TextSpan(
                  text: AppLocale.footer3.getString(context),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

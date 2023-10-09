import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:raihanrabbani001/app_locale.dart';

class CredentialView extends StatelessWidget {
  const CredentialView({super.key, required this.url});
  final void Function(String) url;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    List<String> roleItems = [
      AppLocale.role1.getString(context),
      AppLocale.role2.getString(context),
    ];
    List<Map<String, dynamic>> contacts = [
      {
        'link': 'https://github.com/raihanrabbani001',
        'iconData': FontAwesomeIcons.github,
      },
      {
        'link': 'https://www.linkedin.com/in/raihan-rabbani-48364023b',
        'iconData': FontAwesomeIcons.linkedin,
      },
      {
        'link': 'https://www.instagram.com/_rraihan01',
        'iconData': FontAwesomeIcons.instagram,
      },
      {
        'link': 'mailto:raihanrabbani.bs@gmail.com',
        'iconData': FontAwesomeIcons.envelope,
      },
      {
        'link': 'https://wa.me/6281220188463',
        'iconData': FontAwesomeIcons.whatsapp,
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I'm",
          style: textTheme.displayMedium,
        ),
        Text(
          'Raihan Rabbani',
          style: textTheme.displayLarge,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: Container(
            width: 200,
            height: 3,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        ...roleItems
            .map((e) => Text(
                  e,
                  style: textTheme.titleSmall,
                ))
            .toList(),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: contacts.map(
            (e) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton.filledTonal(
                  onPressed: () => url(e['link']),
                  icon: FaIcon(e['iconData']),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
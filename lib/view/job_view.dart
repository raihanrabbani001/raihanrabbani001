import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:raihanrabbani001/app_locale.dart';
import 'package:raihanrabbani001/viewmodel/theme_viewmodel.dart';

class JobView extends StatelessWidget {
  const JobView({super.key, required this.url, this.height, this.top = false, this.isDesktop = false});
  final void Function(String) url;
  final double? height;
  final bool top;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    List<Map<String, dynamic>> jobExperiences = [
      {
        'date': 'Nov 2017 - Dec 2017',
        'title': 'PT Pertamina Geothermal Energy Area Kamojang',
        'role': 'Field Industrial Practice - IT Support',
        'jobdesc': AppLocale.experience1.getString(context),
        'badgeSkill': [
          'Computer Assembly',
          'OS Installation',
          'Applications',
          'Local Area Network',
        ],
        'link':
            'https://www.google.com/search?q=PT+Pertamina+Geothermal+Energy+Area+Kamojang',
      },
      {
        'date': 'Jul 2021 - Jul 2022',
        'title': 'SMK Plus Pratama Adi',
        'role': 'Teacher',
        'jobdesc': AppLocale.experience2.getString(context),
        'badgeSkill': [
          'C++',
          'Java',
          'Object Oriented Programming',
          'MySQL',
          'Teaching',
          'Guiding',
        ],
        'link': 'https://www.google.com/search?q=SMK+Plus+Pratama+Adi',
      },
      {
        'date': 'Jul 2019 - Jul 2023',
        'title': 'Apotek Riefara',
        'role': 'Staff - IT Support',
        'jobdesc': AppLocale.experience3.getString(context),
        'badgeSkill': [
          'Running Text',
          'Arduino',
          'Visual Basic .NET',
        ],
        'link': 'https://www.google.com/search?q=Apotek+Riefara',
      },
      {
        'date': 'Jul 2019 - Jul 2023',
        'title': 'Klinik Pratama Rahmah Ermansyah',
        'role': 'Staff - IT Support',
        'jobdesc': AppLocale.experience4.getString(context),
        'badgeSkill': [
          'MikroTik',
          'CCTV',
          'Asset Management',
          'Troubleshooting',
          'Maintenance',
        ],
        'link':
            'https://www.google.com/search?q=Klinik+Pratama+Rahmah+Ermansyah',
      }
    ];

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children:
                jobExperiences.asMap().entries.toList().reversed.map<Widget>((e) {
              int index = e.key + 1;
              Map<String, dynamic> value = e.value;
              bool isHover =
                  index == context.watch<ThemeViewModel>().indexJobExperince;
              final bool isIgnored =
                  (context.watch<ThemeViewModel>().indexJobExperince > 0 &&
                      index != context.watch<ThemeViewModel>().indexJobExperince);
              return MouseRegion(
                onEnter: (_) =>
                    context.read<ThemeViewModel>().setIndexJobExperience(index),
                onExit: (_) =>
                    context.read<ThemeViewModel>().setIndexJobExperience(0),
                child: GestureDetector(
                  onTap: () => url(value['link']),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isHover
                          ? colorScheme.primary.withOpacity(0.03)
                          : Colors.transparent,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        top ? const SizedBox() : SizedBox(
                          width: 150,
                          child: Text(
                            value['date'],
                            style: isHover
                                ? textTheme.bodySmall!.copyWith(
                                    color: colorScheme.onSurface.withOpacity(0.7))
                                : (isIgnored
                                    ? textTheme.bodySmall!.copyWith(
                                        color:
                                            colorScheme.onSurface.withOpacity(0.2))
                                    : textTheme.bodySmall),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              top ? Text(
                            value['date'],
                            style: isHover
                                ? textTheme.bodySmall!.copyWith(
                                    color: colorScheme.onSurface.withOpacity(0.7))
                                : (isIgnored
                                    ? textTheme.bodySmall!.copyWith(
                                        color:
                                            colorScheme.onSurface.withOpacity(0.2))
                                    : textTheme.bodySmall),
                          ) : const SizedBox(),
                              Text(
                                value['title'],
                                style: isHover
                                    ? textTheme.titleSmall!
                                        .copyWith(color: colorScheme.primary)
                                    : (isIgnored
                                        ? textTheme.titleSmall!.copyWith(
                                            color: colorScheme.onSurface
                                                .withOpacity(0.2))
                                        : textTheme.titleSmall),
                              ),
                              Text(
                                value['role'],
                                style: isHover
                                    ? textTheme.titleSmall!.copyWith(
                                        color:
                                            colorScheme.onSurface.withOpacity(0.8))
                                    : (isIgnored
                                        ? textTheme.titleSmall!.copyWith(
                                            color: colorScheme.onSurface
                                                .withOpacity(0.2))
                                        : textTheme.titleSmall),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                value['jobdesc'],
                                style: isHover
                                    ? textTheme.bodySmall!.copyWith(
                                        color:
                                            colorScheme.onSurface.withOpacity(0.8))
                                    : (isIgnored
                                        ? textTheme.bodySmall!.copyWith(
                                            color: colorScheme.onSurface
                                                .withOpacity(0.2))
                                        : textTheme.bodySmall),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                runAlignment: WrapAlignment.center,
                                runSpacing: 8,
                                spacing: 8,
                                children: value['badgeSkill'].map<Widget>((e) {
                                  return Chip(
                                    side:
                                        const BorderSide(color: Colors.transparent),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    label: Text(
                                      e,
                                      style: textTheme.labelSmall!.copyWith(
                                          color: isHover
                                              ? colorScheme.primary
                                              : (isIgnored
                                                  ? colorScheme.primary
                                                      .withOpacity(0.1)
                                                  : colorScheme.primary
                                                      .withOpacity(0.8)),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    backgroundColor: isHover
                                        ? colorScheme.primary.withOpacity(0.2)
                                        : (isIgnored
                                            ? colorScheme.primary.withOpacity(0.08)
                                            : colorScheme.secondary
                                                .withOpacity(0.08)),
                                    elevation: 0,
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

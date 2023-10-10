import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:raihanrabbani001/app_locale.dart';
import 'package:raihanrabbani001/viewmodel/theme_viewmodel.dart';

class ProjectView extends StatelessWidget {
  const ProjectView(
      {super.key, required this.url, required this.bodyLargeLabel, this.height, this.flex = 0});
  final void Function(String) url;
  final TextStyle bodyLargeLabel;
  final double? height;
  final int flex;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    List<Map<String, dynamic>> projects = [
      {
        'title': 'Rhealth',
        'thumbnail': 'images/rhealth/logo.png',
        'description': AppLocale.project1.getString(context),
        'year': '2023',
        'detail': {
          'duration': '6 Month',
          'badgeTechnology': [
            'Laravel 10',
            'MVC',
            'Tailwind 3',
            'MySQL',
            'XAMPP',
          ],
          'link': 'https://github.com/raihanrabbani001/laravel-rhealth',
        }
      },
      {
        'title': 'Rsite',
        'thumbnail': 'images/rsite/logo.png',
        'description': AppLocale.project2.getString(context),
        'year': '2023',
        'detail': {
          'duration': '1 Month',
          'badgeTechnology': [
            'Flutter 3',
            'MVVM',
            'Provider',
            'Material 3',
          ],
          'link': 'https://github.com/raihanrabbani001/raihanrabbani001',
        }
      }
    ];

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocale.nav2.getString(context),
              style: bodyLargeLabel,
            ),
            SizedBox(
              height: height,
              child: SingleChildScrollView(
                child: Column(
                  children:
                      projects.asMap().entries.toList().reversed.map<Widget>((e) {
                    int index = e.key + 1;
                    Map<String, dynamic> value = e.value;
                    Map<String, dynamic> detail = value['detail'];
                    bool isHover =
                        index == context.watch<ThemeViewModel>().indexProject;
                    final bool isIgnored =
                        (context.watch<ThemeViewModel>().indexProject > 0 &&
                            index != context.watch<ThemeViewModel>().indexProject);
                    return MouseRegion(
                      onEnter: (_) =>
                          context.read<ThemeViewModel>().setIndexProject(index),
                      onExit: (_) =>
                          context.read<ThemeViewModel>().setIndexProject(0),
                      child: GestureDetector(
                        onTap: () => url(detail['link']),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(value['thumbnail']),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              value['title'],
                                              style: isHover
                                                  ? textTheme.titleMedium!.copyWith(
                                                      color: colorScheme.primary)
                                                  : (isIgnored
                                                      ? textTheme.titleMedium!
                                                          .copyWith(
                                                              color: colorScheme
                                                                  .onSurface
                                                                  .withOpacity(0.2))
                                                      : textTheme.titleMedium),
                                            ),
                                            AnimatedPadding(
                                              curve: Curves.easeIn,
                                              padding: EdgeInsets.only(
                                                  left: isHover ? 8 : 2),
                                              duration:
                                                  const Duration(milliseconds: 100),
                                              child: Icon(Icons.link,
                                                  size: 12,
                                                  color: isHover
                                                      ? colorScheme.primary
                                                      : (isIgnored
                                                          ? colorScheme.onSurface
                                                              .withOpacity(0.2)
                                                          : colorScheme.onSurface)),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              value['year'],
                                              style: isHover
                                                  ? textTheme.titleSmall!.copyWith(
                                                      color: colorScheme.onSurface
                                                          .withOpacity(0.8))
                                                  : (isIgnored
                                                      ? textTheme.titleSmall!
                                                          .copyWith(
                                                              color: colorScheme
                                                                  .onSurface
                                                                  .withOpacity(0.2))
                                                      : textTheme.titleSmall),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 4),
                                              child: Text(
                                                '|',
                                                style: textTheme.labelSmall,
                                              ),
                                            ),
                                            Text(
                                              detail['duration'],
                                              style: textTheme.labelSmall,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      child: Text(
                                        value['description'],
                                        style: isHover
                                            ? textTheme.bodySmall!.copyWith(
                                                color: colorScheme.onSurface
                                                    .withOpacity(0.8))
                                            : (isIgnored
                                                ? textTheme.bodySmall!.copyWith(
                                                    color: colorScheme.onSurface
                                                        .withOpacity(0.2))
                                                : textTheme.bodySmall),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Wrap(
                                      runAlignment: WrapAlignment.center,
                                      runSpacing: 8,
                                      spacing: 8,
                                      children: detail['badgeTechnology']
                                          .map<Widget>((e) {
                                        return Chip(
                                          side: const BorderSide(
                                              color: Colors.transparent),
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
                                                  ? colorScheme.primary
                                                      .withOpacity(0.08)
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
          ],
        ),
      ),
    );
  }
}

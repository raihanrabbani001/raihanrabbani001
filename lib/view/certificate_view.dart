import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:raihanrabbani001/app_locale.dart';
import 'package:raihanrabbani001/viewmodel/theme_viewmodel.dart';

class CertificateView extends StatelessWidget {
  const CertificateView(
      {super.key, required this.bodyLargeLabel, required this.url, this.top = false});
  final void Function(String) url;
  final TextStyle bodyLargeLabel;
  final bool top;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    List<Map<String, dynamic>> certificates = [
      {
        'title': 'Fiber Optik',
        'thumbnail': 'images/certificates/fo.png',
        'organizer': 'Netkrom Academy',
        'date': 'Jul 13, 2018',
        'link':
            'https://www.google.com/search?q=netkrom+verify+certification+code+Fiber+Optik+Net_FO-AA089',
      },
      {
        'title': 'MikroTik Certified Network Associate',
        'thumbnail': 'images/certificates/mtcna.png',
        'organizer': 'Netkrom Academy',
        'date': 'Feb 19, 2019',
        'link':
            'https://www.google.com/search?q=netkrom+verify+certification+code+Fiber+Optik+Net_FO-AA089',
      },
      {
        'title': 'Memulai Pemrograman Dengan Dart',
        'thumbnail': 'images/certificates/mpdd.png',
        'organizer': 'Dicoding',
        'date': 'Jun 07, 2022',
        'link': 'https://www.dicoding.com/certificates/NVP7KOY94ZR0',
      },
      {
        'title': 'Belajar Membuat Aplikasi Flutter untuk Pemula',
        'thumbnail': 'images/certificates/bmafp.png',
        'organizer': 'Dicoding',
        'date': 'Jul 30, 2022',
        'link': 'https://www.dicoding.com/certificates/L4PQ4W827XO1',
      },
      {
        'title': 'Belajar Dasar Pemrograman JavaScript',
        'thumbnail': 'images/certificates/bdpj.png',
        'organizer': 'Dicoding',
        'date': 'Sep 28, 2022',
        'link': 'https://www.dicoding.com/certificates/2VX31GKONZYQ',
      },
      {
        'title': 'Belajar Dasar Pemrograman Web',
        'thumbnail': 'images/certificates/bdpw.png',
        'organizer': 'Dicoding',
        'date': 'Oct 06, 2022',
        'link': 'https://www.dicoding.com/certificates/EYX42D6KWZDL',
      },
      {
        'title': 'Belajar Membuat Front-End Web untuk Pemula',
        'thumbnail': 'images/certificates/bmfep.png',
        'organizer': 'Dicoding',
        'date': 'Oct 15, 2022',
        'link': 'https://www.dicoding.com/certificates/NVP799GWVZR0',
      },
      {
        'title': 'Dasar-Dasar Dukungan Teknis',
        'thumbnail': 'images/certificates/dddt.png',
        'organizer': 'Coursera',
        'date': 'May 19, 2022',
        'link': 'https://coursera.org/verify/QEHU8XJFSMKG',
      },
      {
        'title': 'Seluk Beluk Jaringan Komputer',
        'thumbnail': 'images/certificates/sbjk.png',
        'organizer': 'Coursera',
        'date': 'May 20, 2022',
        'link': 'https://coursera.org/verify/CG2Q9Z7F9UN5',
      },
      {
        'title': 'Sistem Operasi dan Anda: Menjadi Pengguna yang Berdaya',
        'thumbnail': 'images/certificates/soa.png',
        'organizer': 'Coursera',
        'date': 'May 21, 2022',
        'link': 'https://coursera.org/verify/VV7ZL9A3QS3P',
      },
      {
        'title': 'Administrasi Sistem dan Layanan Infrastruktur TI',
        'thumbnail': 'images/certificates/asli.png',
        'organizer': 'Coursera',
        'date': 'May 22, 2022',
        'link': 'https://coursera.org/verify/QEHU8XJFSMKG',
      },
      {
        'title': 'Keamanan IT: Pertahanan terhadap Kejahatan Digital',
        'thumbnail': 'images/certificates/kit.png',
        'organizer': 'Coursera',
        'date': 'May 22, 2022',
        'link': 'https://coursera.org/verify/CVZF78SWLRJK',
      },
      {
        'title': 'IT Support Google',
        'thumbnail': 'images/certificates/its.png',
        'organizer': 'Coursera',
        'date': 'May 22, 2022',
        'link': 'https://coursera.org/verify/professional-cert/JDA6FNCPNTKM',
      },
    ];
    
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocale.nav3.getString(context),
            style: bodyLargeLabel,
          ),
          SizedBox(
            height: 300,
            child: SingleChildScrollView(
              child: Column(
                children: certificates
                    .asMap()
                    .entries
                    .toList()
                    .reversed
                    .map<Widget>((e) {
                  int index = e.key + 1;
                  Map<String, dynamic> value = e.value;
                  bool isHover =
                      index == context.watch<ThemeViewModel>().indexAchievement;
                  final bool isIgnored =
                      (context.watch<ThemeViewModel>().indexAchievement > 0 &&
                          index !=
                              context.watch<ThemeViewModel>().indexAchievement);
                  return MouseRegion(
                    onEnter: (_) =>
                        context.read<ThemeViewModel>().setIndexAchievement(index),
                    onExit: (_) =>
                        context.read<ThemeViewModel>().setIndexAchievement(0),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Image.asset(
                                value['thumbnail'],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  top ? Text(
                                            value['date'],
                                            style: isHover
                                                ? textTheme.labelSmall!.copyWith(
                                                    color: colorScheme.onSurface
                                                        .withOpacity(0.8))
                                                : (isIgnored
                                                    ? textTheme.labelSmall!
                                                        .copyWith(
                                                            color: colorScheme
                                                                .onSurface
                                                                .withOpacity(0.2))
                                                    : textTheme.labelSmall),
                                          ) : const SizedBox(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: Text(
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
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          AnimatedContainer(
                                            duration:
                                                const Duration(milliseconds: 100),
                                            curve: Curves.easeInCirc,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 8),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: isHover
                                                  ? colorScheme.primary
                                                      .withOpacity(0.05)
                                                  : Colors.transparent,
                                            ),
                                            child: Text(
                                              AppLocale.achievement
                                                  .getString(context),
                                              style: TextStyle(
                                                  color: isHover
                                                      ? colorScheme.primary
                                                      : Colors.transparent,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          top ? const SizedBox() : Text(
                                            value['date'],
                                            style: isHover
                                                ? textTheme.labelSmall!.copyWith(
                                                    color: colorScheme.onSurface
                                                        .withOpacity(0.8))
                                                : (isIgnored
                                                    ? textTheme.labelSmall!
                                                        .copyWith(
                                                            color: colorScheme
                                                                .onSurface
                                                                .withOpacity(0.2))
                                                    : textTheme.labelSmall),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    child: Text(
                                      value['organizer'],
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
    );
  }
}

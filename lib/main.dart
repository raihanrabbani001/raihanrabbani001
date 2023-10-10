import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:raihanrabbani001/app_locale.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raihanrabbani001/view/layout_view.dart';
import 'package:raihanrabbani001/viewmodel/theme_viewmodel.dart';


void main() {
  runApp(
    
    MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeViewModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => AppLang(),
      ),
    ],
    child: const MyApp(),
  ));
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    _localization.init(
      mapLocales: [
        const MapLocale(
          'en',
          AppLocale.EN,
          countryCode: 'US',
        ),
        const MapLocale(
          'id',
          AppLocale.ID,
          countryCode: 'ID',
        ),
      ],
      initLanguageCode: 'en',
    );
    _localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      title: 'Rsite',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: context.watch<ThemeViewModel>().mainColor,
          brightness: context.watch<ThemeViewModel>().isDark,
        ),
        textTheme: GoogleFonts.interTextTheme(
                ThemeData(brightness: context.watch<ThemeViewModel>().isDark)
                    .textTheme)
            .copyWith(
          displayLarge: const TextStyle(
              fontWeight: FontWeight.w900, height: 1, letterSpacing: -3),
          titleMedium:
              const TextStyle(fontWeight: FontWeight.w700, letterSpacing: 1),
          titleSmall:
              const TextStyle(fontWeight: FontWeight.w400, letterSpacing: 1),
          bodyLarge: const TextStyle(
            fontWeight: FontWeight.w400,
          ),
          labelSmall: const TextStyle(
            fontSize: 10,
          ),
        ),
        useMaterial3: true,
      ),
      home: const LayoutView(),
    );
  }
}



import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raihanrabbani001/view/about_view.dart';
import 'package:raihanrabbani001/view/avatar_view.dart';
import 'package:raihanrabbani001/view/certificate_view.dart';
import 'package:raihanrabbani001/view/credential_view.dart';
import 'package:raihanrabbani001/view/footer_view.dart';
import 'package:raihanrabbani001/view/header_view.dart';
import 'package:raihanrabbani001/view/job_view.dart';
import 'package:raihanrabbani001/view/moto_view.dart';
import 'package:raihanrabbani001/view/project_view.dart';
import 'package:raihanrabbani001/view/screen_view.dart';
import 'package:raihanrabbani001/viewmodel/theme_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  void _url(String url) {
    launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {

    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle bodyLargeLabel = textTheme.bodyLarge!.copyWith(
      color: colorScheme.onSurface.withOpacity(0.3),
      height: 3,
    );


    Widget child() {
      final double screenWidth = MediaQuery.of(context).size.width;
      final Widget child;
      final Widget mobile = ScreenView(
        screenMode: ScreenMode.mobile,
        primaryChild: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderView(),
              const AvatarView(),
              CredentialView(url: (String url) => _url(url)),
              MotoView(
                bodyLargeLabel: bodyLargeLabel,
                url: (String url) => _url(url),
              ),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              AboutView(bodyLargeLabel: bodyLargeLabel),
              JobView(
                url: (String url) => _url(url),
                top: true,
              ),
              ProjectView(
                  url: (String url) => _url(url),
                  bodyLargeLabel: bodyLargeLabel),
              CertificateView(
                bodyLargeLabel: bodyLargeLabel,
                url: (String url) => _url(url),
                top: true,
              ),
              const SizedBox(
                height: 20,
              ),
              const FooterView(),
            ],
          ),
        ),
      );

      final Widget tablet = ScreenView(
        screenMode: ScreenMode.tablet,
        primaryChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderView(),
            Row(
              children: [
                const AvatarView(),
                CredentialView(url: (String url) => _url(url)),
              ],
            ),
            MotoView(
              bodyLargeLabel: bodyLargeLabel,
              url: (String url) => _url(url),
            ),
          ],
        ),
        child: Column(
          children: [
            AboutView(bodyLargeLabel: bodyLargeLabel),
            JobView(
              url: (String url) => _url(url),
            ),
            ProjectView(
                url: (String url) => _url(url), bodyLargeLabel: bodyLargeLabel),
            CertificateView(
                bodyLargeLabel: bodyLargeLabel, url: (String url) => _url(url)),
            const FooterView(),
          ],
        ),
      );
      final Widget desktop = ScreenView(
        screenMode: ScreenMode.desktop,
        primaryChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderView(),
            Row(
              children: [
                CredentialView(url: (String url) => _url(url)),
                const AvatarView(),
                const SizedBox(
                  width: 10,
                ),
                MotoView(
                  bodyLargeLabel: bodyLargeLabel,
                  url: (String url) => _url(url),
                ),
              ],
            ),
          ],
        ),
        
        child: Column(
          children: [
            Row(
              children: [
                AboutView(
                  bodyLargeLabel: bodyLargeLabel,
                  flex: 1,
                ),
                JobView(
                  url: (String url) => _url(url),
                  height: 350,
                ),
              ],
            ),
            Row(
              children: [
                CertificateView(
                  bodyLargeLabel: bodyLargeLabel,
                  url: (String url) => _url(url),
                  flex: 1,
                  height: 300,
                ),
                ProjectView(
                  url: (String url) => _url(url),
                  bodyLargeLabel: bodyLargeLabel,
                  flex: 1,
                  height: 300,
                ),
              ],
            ),
            const FooterView(),
          ],
        ),
      );
      if (screenWidth < 700) {
        child = mobile;
      } else if (screenWidth < 1060) {
        child = tablet;
      } else {
        child = desktop;
      }
      
      return child;
    }

    return Scaffold(
      body: MouseRegion(
        onHover: (details) {
          context.read<ThemeViewModel>().updateCursorPosition(details.position);
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: context.watch<ThemeViewModel>().dx - 400,
              top: context.watch<ThemeViewModel>().dy - 400,
              child: Container(
                width: 800,
                height: 800,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme.primary.withOpacity(0.04),
                ),
              ),
            ),
            Container(
              color: colorScheme.surface.withOpacity(0.1),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.05)),
                ),
              ),
            ),
            SingleChildScrollView(
              child: child(),
            ),
          ],
        ),
      ),
    );
  }
}

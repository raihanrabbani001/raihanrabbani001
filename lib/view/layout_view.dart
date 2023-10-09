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

    Container primaryContainer(
        {required Widget child, required EdgeInsetsGeometry padding, double? height}) {
      return Container(
        width: context.watch<ThemeViewModel>().currentViewPort,
        height: height,
        padding: padding,
        child: child,
      );
    }

    Stack secondaryContainer({required Widget child, required double height}) {
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 100),
            height: height,
            color: colorScheme.surface.withOpacity(0.5),
          ),
          Container(
            width: context.watch<ThemeViewModel>().currentViewPort,
            padding: const EdgeInsets.symmetric(vertical: 20),
            height: height,
            child: child,
          ),
        ],
      );
    }

    Size size = MediaQuery.of(context).size;

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
            ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: context.watch<ThemeViewModel>().screenMode(
                      context: context,
                      desktop: Column(
                        children: [
                          primaryContainer(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const HeaderView(),
                                  Row(
                                    children: [
                                      CredentialView(
                                          url: (String url) => _url(url)),
                                      const AvatarView(),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      MotoView(
                                      bodyLargeLabel: bodyLargeLabel,
                                      url: (String url) => _url(url),
                                    ),
                                    ],
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.only(top: 40)),
                          secondaryContainer(
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AboutView(bodyLargeLabel: bodyLargeLabel, flex: 1,),
                                   JobView(
                                  url: (String url) => _url(url),
                                  height: 250,
                                ),
                                  ],
                                ),
                                 
                                ProjectView(
                                    url: (String url) => _url(url),
                                    bodyLargeLabel: bodyLargeLabel),
                                CertificateView(
                                    bodyLargeLabel: bodyLargeLabel,
                                    url: (String url) => _url(url)),
                                const FooterView(),
                              ],
                            ),
                            height: 1050,
                          ),
                        ],
                      ),
                      tablet: Column(
                        children: [
                          primaryContainer(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const HeaderView(),
                                  Row(
                                    children: [
                                      const AvatarView(),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      CredentialView(
                                          url: (String url) => _url(url)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: MotoView(
                                      bodyLargeLabel: bodyLargeLabel,
                                      url: (String url) => _url(url),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.only(top: 40)),
                          secondaryContainer(
                            child: Column(
                              children: [
                                AboutView(bodyLargeLabel: bodyLargeLabel),
                                JobView(
                                  url: (String url) => _url(url),
                                ),
                                ProjectView(
                                    url: (String url) => _url(url),
                                    bodyLargeLabel: bodyLargeLabel),
                                CertificateView(
                                    bodyLargeLabel: bodyLargeLabel,
                                    url: (String url) => _url(url)),
                                const FooterView(),
                              ],
                            ),
                            height: 1700,
                          ),
                        ],
                      ),
                      mobile: Column(
                        children: [
                          primaryContainer(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const HeaderView(),
                                    const AvatarView(),
                                    CredentialView(
                                        url: (String url) => _url(url)),
                                    MotoView(
                                      bodyLargeLabel: bodyLargeLabel,
                                      url: (String url) => _url(url),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                              padding: const EdgeInsets.only(top: 40), height: 850),
                          secondaryContainer(
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
                                      url: (String url) => _url(url),top: true,),
                                      const SizedBox(height: 20,),
                                  const FooterView(),
                                ],
                              ),
                            ),
                            height: 2100,
                          ),
                        ],
                      ),
                    ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(size.width.toString()),
                Text(
                    context.watch<ThemeViewModel>().currentViewPort.toString()),
              ],
            )
          ],
        ),
      ),
    );
  }
}

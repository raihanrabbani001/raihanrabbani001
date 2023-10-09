import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:raihanrabbani001/app_locale.dart';

class MotoView extends StatelessWidget {
  const MotoView({super.key, required this.bodyLargeLabel, required this.url});
  final void Function(String) url;
  final TextStyle bodyLargeLabel;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocale.moto1.getString(context),
            style: bodyLargeLabel,
          ),
          Text(
            AppLocale.moto2.getString(context),
            style: textTheme.bodyLarge,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: FilledButton.tonalIcon(
                onPressed: () => url('https://drive.google.com/file/d/1TUEZBSUMmMARJ9Z95UA17DZ9GDm9iqxu/view?usp=sharing'),
                icon: const Icon(Icons.cloud_download_outlined),
                label: const Text('Download resume - ID')),
          ),
        ],
      ),
    );
  }
}
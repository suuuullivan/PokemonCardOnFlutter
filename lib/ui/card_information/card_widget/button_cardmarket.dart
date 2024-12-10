import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../themes/app_color.dart';
import '../../../themes/app_theme.dart';

class ButtonCardMarket extends StatefulWidget {
  final String urlCardMarket;

  const ButtonCardMarket({super.key, required this.urlCardMarket});

  @override
  _ButtonCardMarketState createState() => _ButtonCardMarketState();
}

class _ButtonCardMarketState extends State<ButtonCardMarket> {
  void _openUrl() async {
    final Uri url = Uri.parse(widget.urlCardMarket);
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: _openUrl,
          icon: const Icon(
            Icons.store,
            color: AppColor.white,
          ),
          label: const Text('Market Link',
              style: AppTheme.fontBoldWhiteAppPokemon),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }
}

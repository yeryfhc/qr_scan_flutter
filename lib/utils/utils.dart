import 'package:flutter/material.dart';
import 'package:qr_reader/provider/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final url = Uri.parse(scan.valor);
  if (scan.tipo == 'http') {
    // abrir el sitio
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'mapa',arguments:scan);
  }
}

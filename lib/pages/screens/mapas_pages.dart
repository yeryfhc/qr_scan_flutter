import 'package:flutter/material.dart';
import 'package:qr_reader/widget/all_widgets.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const ScanTiles(tipo: 'geo');
  }
}

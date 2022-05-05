import 'package:flutter/material.dart';

import '../../widget/scan_tiles.dart';

class DirecionesPage extends StatelessWidget {
  const DirecionesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return const ScanTiles(tipo: 'http');
  }
}

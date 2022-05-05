import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/utils/utils.dart';

import '../provider/scan_list_provider.dart';

//  import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        onPressed: () async {
          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);

          // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          //     '#ff6666', 'Cancel', false, ScanMode.QR);
          const barcodeScanRes = 'geo:19.46949586570304,-70.68981574850933';

          // const barcodeScanRes = 'https://www.youtube.com';
          if (barcodeScanRes == '-1') {
            return;
          }

          final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
          launchURL(context, nuevoScan);
        },
        child: const Icon(Icons.camera));
  }
}

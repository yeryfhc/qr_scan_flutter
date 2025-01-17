import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/utils/utils.dart';

import '../provider/scan_list_provider.dart';

class ScanTiles extends StatefulWidget {
  final String tipo;

  const ScanTiles({Key? key, required this.tipo}) : super(key: key);

  @override
  State<ScanTiles> createState() => _ScanTilesState();
}

class _ScanTilesState extends State<ScanTiles> {
  @override
  Widget build(BuildContext context) {
     final scanListProvider = Provider.of<ScanListProvider>(context);

    final scans = scanListProvider.scans;
    
    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, int i) {
           final  y = scans[i].id;
          return Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.deepPurple,
              child: const Center(child:Text('DELETE',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),
            ),
            onDismissed: (DismissDirection direction) {
              Provider.of<ScanListProvider>(context, listen: false)
                  .borrarScansPorId(y!);
                
            },
            child: ListTile(
              leading: Icon(
                widget.tipo == 'http'
                ?Icons.directions
                :Icons.map,


              
                color: Theme.of(context).primaryColor,
              ),
              title: Text(scans[i].valor),
              subtitle: Text(scans[i].id.toString()),
              trailing: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
              onTap: () => launchURL(context, scans[i]),
            ),
          );
        });
  }
}

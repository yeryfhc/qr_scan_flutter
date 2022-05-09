import 'package:flutter/material.dart';
import 'package:qr_reader/provider/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];

  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevocan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScanRaw(nuevocan);
    // asignar id de la bd al modelo
    nuevocan.id = id;

    if (tipoSeleccionado == nuevocan.tipo) {
      scans.add(nuevocan);
      notifyListeners();
    }
    return nuevocan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getTodosLOsScan();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async {
    final scans = await DBProvider.db.getScanPorTipo(tipo);
    this.scans = [...?scans];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllScan();
    scans = [];
    notifyListeners();
  }

  borrarScansPorId(int id) async {
    await DBProvider.db.deleteScan(id);
   
  }
}

import 'dart:io';

// import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:qr_reader/models/scan_models.dart';
export 'package:qr_reader/models/scan_models.dart';

class DBProvider {
  static Database? _database;

  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    //  path de donde almacenarem,os la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    // ignore: avoid_print
    print(path);

    //  create data base
    return await openDatabase(path, version:1,onOpen: (db) { },
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Scans ("
          "id INTEGER PRIMARY KEY,"
          "tipo TEXT,"
          "valor TEXT"
          ")");
    });
  }

  Future<int?>nuevoScanRaw(ScanModel nuevoScan) async {
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;
    // verificar base de datos
    final db = await database;
    final res = await db?.rawInsert('''
INSERT INTO Scans(id,tipo,valor)
 VALUES($id,'$tipo','$valor')

''');

    return res;
  }

  // Future<int?> nuevoScan(ScanModel nuevoScans) async {
  //   final db = await database;
  //   final res = await db?.insert('Scans', nuevoScans.toJson());
  //   //  este es el id del ultimo registro
  //   return res;
  // }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db!.query('Scans', where: 'id=?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getTodosLOsScan() async {
    final db = await database;
    final res = await db!.query('Scans');

    return res.isNotEmpty
        ? res.map((s) => ScanModel.fromJson(s)).toList()
        : [];
  }
  
Future<List<ScanModel>?> getScanPorTipo(String tipo) async {
    final db = await database;
    final res = await db!.query('Scans', where: 'tipo=?', whereArgs: [tipo]);
    return res.isNotEmpty 
           ? res.map((s) => ScanModel.fromJson(s)).toList()
             : [];
  }



//   Future<List<ScanModel>?> getScanPorTipo(String tipo) async {
//     final db = await database;
//     final res = await db!.rawQuery('''
//        SELECT * FROM Scans WHERE tipo = '$tipo'
// ''');
//     return res.isNotEmpty
//         ? res.map((s) => ScanModel.fromJson(s)).toList()
//         : [];
//   }

  Future<int?> updateSan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db?.update('Scans', nuevoScan.toJson(),
        where: 'id=?', whereArgs: [nuevoScan.id]);

    return res;
  }

  Future<int?> deleteScan(int id) async {
    final db = await database;
    final res = await db?.delete('Scans', where: 'id=?', whereArgs: [id]);
    return res;
  }

 Future<int?> deleteAllScan() async {
    final db = await database;
    final res = await db?.delete('Scans');
    return res;
  }

}

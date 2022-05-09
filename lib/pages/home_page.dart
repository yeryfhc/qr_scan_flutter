import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/allpages.dart';
import 'package:qr_reader/provider/scan_list_provider.dart';

import 'package:qr_reader/provider/ui_provider.dart';
import 'package:qr_reader/widget/all_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        // backgroundColor: Colors.transparent,
        appBar: AppBar(
            flexibleSpace: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 90, sigmaY: 70),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(80)),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            elevation: 0,
            title: const Text(
              'Read QR',
              style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.normal,
                  color: Colors.deepPurple),
            ),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 236, 229, 229),
            actions: [
              IconButton(
                  onPressed: () {
                    Provider.of<ScanListProvider>(context, listen: false)
                        .borrarTodos();
                  },
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.deepPurple,
                  ))
            ]),
        body: Stack(children: [const BackGraund(), _HomePageBody()]),
        bottomNavigationBar: const CustonNavigatorBar(),
        floatingActionButton: const ScanButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

// ignore: unused_element
class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context, listen: true);

    final currentIndex = uiProvider.selectedMenuOpt;

    //  Usar el ScanListProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return const MapasPage();

      case 1:
        scanListProvider.cargarScansPorTipo('http');

        return const DirecionesPage();

      default:
        return const MapasPage();
    }
  }
}

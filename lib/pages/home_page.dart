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
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomLeft,
                stops: [
              0.2,
              0.8
            ],
                colors: [
              Color.fromARGB(15, 243, 155, 155),
              Color.fromARGB(0, 243, 245, 245)
            ])),
      
        child: Scaffold(   
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              'Read QR',
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
            ),
            centerTitle: true,
            backgroundColor: Colors.deepPurple,
            actions: [
              IconButton(
                  onPressed: () {
                    Provider.of<ScanListProvider>(context, listen: false)
                        .borrarTodos();
                  },
                  icon: const Icon(Icons.delete_forever))
            ],
          ),
          body: Stack(children: [const BackGraund(), _HomePageBody()]),
          bottomNavigationBar: const CustonNavigatorBar(),
          floatingActionButton: const ScanButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
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

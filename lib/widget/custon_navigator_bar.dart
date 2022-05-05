import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/provider/ui_provider.dart';

class CustonNavigatorBar extends StatelessWidget {
  const CustonNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
        onTap: (int i) => uiProvider.selectedMenuOpt = i,
        elevation: 0,
        currentIndex: currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.map,
              ),
              label: 'Mapa'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.route,
            ),
            label: 'Direciones',
          )
        ]);
  }
}

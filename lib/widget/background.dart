import 'package:flutter/material.dart';

class BackGraund extends StatelessWidget {
  const BackGraund({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment(
                0.3,
                0.5,
              ),
              stops: [0.4, 8.3],
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 215, 193, 252)
              ],
              tileMode: TileMode.mirror)),
    );
  }
}

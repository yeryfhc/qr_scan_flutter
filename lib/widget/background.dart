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
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [
            Color.fromARGB(15, 210, 130, 130),
            Color.fromARGB(0, 78, 255, 255)
          ])),
    );
  }
}

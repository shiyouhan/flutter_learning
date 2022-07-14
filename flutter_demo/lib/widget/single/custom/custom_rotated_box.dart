// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomRotatedBox extends StatefulWidget {
  const CustomRotatedBox({Key? key}) : super(key: key);

  @override
  _CustomRotatedBoxState createState() => _CustomRotatedBoxState();
}

class _CustomRotatedBoxState extends State<CustomRotatedBox> {
  int _quarterTurns = 0;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: _quarterTurns,
      child: Container(
        width: 100,
        height: 100,
        child: GestureDetector(
          onTap: () => setState(() => _quarterTurns++),
          child: const Icon(
            Icons.android,
            size: 60,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

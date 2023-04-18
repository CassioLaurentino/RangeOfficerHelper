import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class Tournaments extends StatelessWidget {
  Tournaments({super.key});

  ValueNotifier<List<String>> _myController = ValueNotifier<List<String>>([]);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tournaments"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          ],
        ),
      )
    );
  }
}
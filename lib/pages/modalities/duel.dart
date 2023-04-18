import 'package:flutter/material.dart';
import 'package:rohelper/pages/numPad.dart';

class Duel extends StatelessWidget {
  Duel({super.key});

  late int points = 0;

  // text controller
  // final TextEditingController _myController = TextEditingController();
  final ValueNotifier<List<String>> _myController = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Duel"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text("Total"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(points.toString()),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(height: 20),
                      const Text("Total 2 "),
                      const SizedBox(height: 20),
                      Text(points.toString())
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Placeholder(
                  color: Colors.red,
                  fallbackHeight: MediaQuery.of(context).size.height * 0.2,
                  fallbackWidth: MediaQuery.of(context).size.width * 0.95,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumPad(
                  controller: _myController,
                  clearAll: () {
                      _myController.value.clear();
                  },
                  delete: () {
                    _myController.value.removeLast();
                  },
                  // do something with the input numbers
                  onSubmit: () {
                    debugPrint('Your code: ${_myController.value}');
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              content: Text(
                                "You code is ${_myController.value}",
                                style: const TextStyle(fontSize: 30),
                              ),
                            ));
                  },
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
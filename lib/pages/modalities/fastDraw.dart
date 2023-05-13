import 'package:flutter/material.dart';
import 'package:rohelper/pages/numPad.dart';

class FastDraw extends StatelessWidget {
  FastDraw({super.key});

  // late int points = 0;

  // text controller
  // final TextEditingController _myController = TextEditingController();
  ValueNotifier<List<String>> _myController = ValueNotifier<List<String>>([]);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Fast Draw"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "Points",
                          style: TextStyle(
                            fontWeight: FontWeight.bold, color: Color.fromARGB(255, 182, 174, 174), fontSize: 20),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ValueListenableBuilder(valueListenable: _myController, builder: (context, value, child) {
                          return getTotalPoints(value);
                        },)
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "Hits",
                          style: TextStyle(
                            fontWeight: FontWeight.bold, color: Color.fromARGB(255, 182, 174, 174), fontSize: 20),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center, 
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ValueListenableBuilder(valueListenable: _myController, builder: (context, value, child) {
                              return Text(
                                value.length.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold, color: Color.fromARGB(255, 182, 174, 174), fontSize: 20),
                                );
                            },),
                          ],
                        )
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: ValueListenableBuilder(valueListenable: _myController, builder: (context, value, child) {
                        return getTextWidgets(value);
                      },),
                    )
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: NumPad(
                    maxHits: 30,
                    controller: _myController,
                    clearAll: () {
                      _myController.value.clear();
                      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                      _myController.notifyListeners();
                    },
                    delete: () {
                      if (_myController.value.isNotEmpty) {
                        _myController.value.removeLast();
                        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                        _myController.notifyListeners();
                      }
                    },
                    // do something with the input numbers
                    onSubmit: () {
                      debugPrint('onSubmit - Your code: ${_myController.value}');
                      // showDialog(
                      //     context: context,
                      //     builder: (_) => AlertDialog(
                      //           content: Text(
                      //             "You code is ${_myController.text}",
                      //             style: const TextStyle(fontSize: 30),
                      //           ),
                      //         ));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}

Widget getTotalPoints(List<String> strings) {
  int points = 0;

  strings.forEach((element) {
    points += int.parse(element);
  });

  return Text(
    points.toString(),
    style: const TextStyle(
      fontWeight: FontWeight.bold, color: Color.fromARGB(255, 182, 174, 174), fontSize: 20),);
}

Widget getTextWidgets(List<String> strings) {
  return Wrap(
    spacing: 5,
    runSpacing: 5,
    children: strings.map(
      (item) => 
        SizedBox(
          width: 70,
          height: 70,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:  const Color.fromARGB(255, 236, 200, 200),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {},
            child: Center(
              child: Text(
                item.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Color.fromARGB(255, 82, 80, 80), fontSize: 30),
              ),
            ),
          ),
        )
      ).toList()
    );
}
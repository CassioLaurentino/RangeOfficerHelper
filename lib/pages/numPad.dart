import 'package:flutter/material.dart';

class NumPad extends StatelessWidget {
  final int maxHits;
  final double buttonWidth;
  final double buttonHeight;
  final Color buttonColor;
  final Color iconColor;
  final ValueNotifier<List<String>> controller;
  final Function delete;
  final Function clearAll;
  final Function onSubmit;

  const NumPad({
    Key? key,
    this.buttonWidth = 55,
    this.buttonHeight = 55,
    this.buttonColor = const Color(0xFF5A5858),
    this.iconColor = Colors.amber,
    required this.maxHits,
    required this.clearAll,
    required this.delete,
    required this.onSubmit,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.65,
              child: Column(
                children: [
                  Column(
                    children: [
                      Wrap(
                        runSpacing: 20,
                        spacing: 10,
                        children: [
                          NumberButton(
                            maxHits: maxHits,
                            number: 7,
                            width: buttonWidth,
                            height: buttonHeight,
                            color: buttonColor,
                            controller: controller,
                          ),
                          const SizedBox(width: 20),
                          NumberButton(
                            maxHits: maxHits,
                            number: 8,
                            width: buttonWidth,
                            height: buttonHeight,
                            color: buttonColor,
                            controller: controller,
                          ),
                          const SizedBox(width: 20),
                          NumberButton(
                            maxHits: maxHits,
                            number: 9,
                            width: buttonWidth,
                            height: buttonHeight,
                            color: buttonColor,
                            controller: controller,
                          ),
                          NumberButton(
                            maxHits: maxHits,
                            number: 4,
                            width: buttonWidth,
                            height: buttonHeight,
                            color: buttonColor,
                            controller: controller,
                          ),
                          const SizedBox(width: 20),
                          NumberButton(
                            maxHits: maxHits,
                            number: 5,
                            width: buttonWidth,
                            height: buttonHeight,
                            color: buttonColor,
                            controller: controller,
                          ),
                          const SizedBox(width: 20),
                          NumberButton(
                            maxHits: maxHits,
                            number: 6,
                            width: buttonWidth,
                            height: buttonHeight,
                            color: buttonColor,
                            controller: controller,
                          ),
                          NumberButton(
                            maxHits: maxHits,
                            number: 1,
                            width: buttonWidth,
                            height: buttonHeight,
                            color: buttonColor,
                            controller: controller,
                          ),
                          const SizedBox(width: 20),
                          NumberButton(
                            maxHits: maxHits,
                            number: 2,
                            width: buttonWidth,
                            height: buttonHeight,
                            color: buttonColor,
                            controller: controller,
                          ),
                          const SizedBox(width: 20),
                          NumberButton(
                            maxHits: maxHits,
                            number: 3,
                            width: buttonWidth,
                            height: buttonHeight,
                            color: buttonColor,
                            controller: controller,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.27,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: 
                    Wrap(
                      alignment: WrapAlignment.end,
                      runSpacing: 20,
                      children: [
                        NumberButton(
                          maxHits: maxHits,
                          number: 10,
                          width: 80,
                          height: 80,
                          color: buttonColor,
                          controller: controller,
                        ),
                        SizedBox(
                          height: 80,
                          width: 80,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              if (controller.value.length >= maxHits) {
                                return;
                              }
                              controller.value.add(10.toString());
                              // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                              controller.notifyListeners();
                            },
                            child: const Center(
                              child: Text("X",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                        // NumberButton(
                        //   number: 10,
                        //   width: 80,
                        //   height: 80,
                        //   color: buttonColor,
                        //   controller: controller,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.95,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onLongPress: () => clearAll(),
                onTap: () => delete(),
                child: Ink(
                  child: const Icon(
                    Icons.backspace,
                    color: Colors.red,
                    size: 60,
                  ),
                ),
              ),
              NumberButton(
                maxHits: maxHits,
                number: 0,
                width: 100,
                height: buttonHeight,
                color: Colors.amber,
                controller: controller,
              ),
              IconButton(
                onPressed: () => onSubmit(),
                // ignore: prefer_const_constructors
                icon: Icon(
                  Icons.done_rounded,
                  color: Colors.green,
                ),
                iconSize: 55,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NumberButton extends StatelessWidget {
  final int maxHits;
  final int number;
  final double width;
  final double height;
  final Color color;
  final ValueNotifier<List<String>> controller;

  const NumberButton({
    Key? key,
    required this.maxHits,
    required this.number,
    required this.width,
    required this.height,
    required this.color,
    required this.controller,
  }) : super(key: key);

  numberToText(number) {
    switch (number) {
      case 0:
        return "miss";
      default:
        return number.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          if (controller.value.length >= maxHits) {
            return;
          }
          controller.value.add(number.toString());
          // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
          controller.notifyListeners();
        },
        child: Center(
          child: Text(
            numberToText(number),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Timer? _timer;
  AudioCache _audioCache = AudioCache();
  bool _isButtonPressed = false;

  final ValueNotifier<int> _secondsRemaining = ValueNotifier<int>(0);

  void _onButtonPressed() {
    setState(() {
      _isButtonPressed = true;
    });

    startTimer();
    _playBeep();
  }

  void _addTenSeconds() {
    _playBeep();
    _secondsRemaining.value += 10;
  }

  void _decrementCounter() {
    _secondsRemaining.value--;
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining.value > 1) {
          _decrementCounter();
        } else {
          _timer?.cancel();
          _secondsRemaining.value = 0;
          _playBeep();
          _isButtonPressed = false;
        }
      });
    });
  }

  void _playBeep() {
    _audioCache.play('sound/beep.mp3');
  }

  Future<void> _showResetConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Reset'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to reset the timer?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Reset'),
              onPressed: () {
                Navigator.of(context).pop();
                _timer?.cancel();
                setState(() {
                  _secondsRemaining.value = 0;
                  _isButtonPressed = false;
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Timer"),
          centerTitle: true,
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _secondsRemaining.value = 30;
                },
                child: Text('30 sec'),
              ),
              ElevatedButton(
                onPressed: () {
                  _secondsRemaining.value = 20;
                },
                child: Text('20 sec'),
              ),
              ElevatedButton(
                onPressed: () {
                  _secondsRemaining.value = 10;
                },
                child: Text('10 sec'),
              ),
              ElevatedButton(
                onPressed: () {
                  _secondsRemaining.value = 8;
                },
                child: Text('8 sec'),
              ),
            ],
          ),
          ValueListenableBuilder<int>(
            valueListenable: _secondsRemaining,
            builder: (BuildContext context, int value, Widget? child) {
              return Text(
                '$value seconds',
                style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Color.fromARGB(255, 182, 174, 174), fontSize: 20),
                );
          },),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _isButtonPressed ? null : _onButtonPressed,
                child: Text('Start'),
              ),
              ElevatedButton(
                onPressed: !_isButtonPressed ? null : _addTenSeconds,
                child: Text('Add 10 sec'),
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _showResetConfirmationDialog();
            },
            child: Text('Reset'),
          ),
        ],
      ),
    );
  }
}

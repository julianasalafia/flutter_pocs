import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _buttonText = 'Iniciar';
  String _stopWatchText = "00:00:00";
  final _stopWatch = Stopwatch();
  final _timeout = const Duration(seconds: 1);

  void _startTimeOut() {
    Timer(_timeout, _handleTimeout);
  }

  void _handleTimeout() {
    if (_stopWatch.isRunning) {
      _startTimeOut();
    }
    setState(() {
      _setStopWatchText();
    });
  }

  void _startStopButtonPressed() {
    setState(() {
      if (_stopWatch.isRunning) {
        _buttonText = 'Start';
        _stopWatch.stop();
      } else {
        _buttonText = 'Stop';
        _stopWatch.start();
        _startTimeOut();
      }
    });
  }

  void _resetButtonPressed() {
    if (_stopWatch.isRunning) {
      _startStopButtonPressed();
    }
    setState(() {
      _stopWatch.reset();
      _setStopWatchText();
    });
  }

  void _setStopWatchText() {
    _stopWatchText =
        '${_stopWatch.elapsed.inHours.toString().padLeft(2, '0')}:${(_stopWatch.elapsed.inMinutes % 60).toString().padLeft(2, '0')}:${(_stopWatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cronômetro')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            child: FittedBox(
                fit: BoxFit.none,
                child: Text(
                  _stopWatchText,
                  style: const TextStyle(fontSize: 72),
                )),
          ),
          Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: _startStopButtonPressed,
                  child: Text(_buttonText),
                ),
                ElevatedButton(
                  onPressed: _resetButtonPressed,
                  child: const Text('Reset'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

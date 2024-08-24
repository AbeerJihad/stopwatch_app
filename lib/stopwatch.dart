import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int seconds = 0;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), _onTick);
  }

  void _onTick(Timer time) {
    if (mounted) {
      setState(() {
        ++seconds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
      ),
      body: Center(
        child: Text(
          '$seconds ${_secondsText()}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }

  String _secondsText() => seconds == 1 ? 'second' : 'seconds';

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:process_loop/process_loop.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProgressLoop Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'ProgressLoop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamSubscription _streamSubscription;
  ProgressLoop _processLoop;
  List<String> list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _processLoop = ProgressLoop(
      executable: "echo",
      arguments: List.of(["hello"]),
      loop: null,
    );
    _processLoop.start();
    _streamSubscription = _processLoop.stdout.listen((newVal) => setState(() {
          list.add(newVal);
        }));
  }

  @override
  void dispose() {
    _processLoop.stop();
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: list.map((e) => Text(e)).toList(),
      ),
    );
  }
}

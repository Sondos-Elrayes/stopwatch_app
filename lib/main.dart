import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/screens/stopwatch_screen.dart';
import 'package:stopwatch/providers/my_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => MyProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StopwatchScreen(),
      ),
    );
  }
}

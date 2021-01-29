import 'package:flutter/material.dart';
import 'package:stopwatch/widgets/my_app_buttons.dart';
import 'package:stopwatch/providers/my_provider.dart';
import 'package:provider/provider.dart';

class StopwatchScreen extends StatefulWidget {
  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  Size deviceSize;
  bool providerStartButtonData;
  Function providerFunctions;
  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    providerStartButtonData = Provider.of<MyProvider>(context).startIsPressed;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: deviceSize.height,
              width: deviceSize.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/ezgif-2-d7d55f0efad9.gif'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          Provider.of<MyProvider>(context).timer,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 40,
                    right: 20,
                    child: Row(
                      children: [
                        MyAppButtons(
                            buttonColor: providerStartButtonData
                                ? Color.fromRGBO(143, 100, 251, .3)
                                : Colors.black45,
                            buttonTitle:
                                providerStartButtonData ? 'Stop' : 'Start',
                            onPressed: () {
                              providerStartButtonData
                                  ? Provider.of<MyProvider>(context,
                                          listen: false)
                                      .stop()
                                  : Provider.of<MyProvider>(context,
                                          listen: false)
                                      .start();
                            }),
                        MyAppButtons(
                            onPressed: () {
                              Provider.of<MyProvider>(context, listen: false)
                                  .reset();
                            },
                            buttonColor: Colors.black45,
                            buttonTitle: 'Reset'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

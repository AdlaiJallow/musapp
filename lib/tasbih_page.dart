import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class TasbihPage extends StatefulWidget {
  const TasbihPage({super.key});

  @override
  State<TasbihPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TasbihPage> {
  int _tasbihCount = 0;

  void _incrementValue() async {
    setState(() {
      _tasbihCount++;
    });
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 100);
    }
  }

  void _restartCount() {
    setState(() {
      _tasbihCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF795548),
          title: const Center(
            child: Text(
              'MusApp',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: _restartCount,
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        fixedSize: const Size(50.0, 75.0)),
                    child: const Icon(
                      Icons.refresh,
                      color: Color(0xFF795548),
                      size: 35.0,
                    ),
                  )),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              fixedSize: const Size(50.0, 75.0)),
                          child: const Icon(
                            Icons.vibration,
                            color: Color(0xFF795548),
                            size: 35.0,
                          ))),
                  const SizedBox(
                    width: 15.0,
                  ),
                ],
              ),
            )),
            const SizedBox(
              height: 70.0,
            ),
            Expanded(
                child: Center(
              child: Column(
                children: [
                  const Text(
                    'Tasbih Count',
                    style: TextStyle(fontSize: 22, color: Colors.brown),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    '$_tasbihCount',
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  )
                ],
              ),
            )),
            const SizedBox(
              height: 25.0,
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: _incrementValue,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown[700],
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(40),
                            elevation: 5,
                          ),
                          child: const Text(
                            'Tap Here',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ))
                    ],
                  ),
                ))
          ],
        ));
  }
}

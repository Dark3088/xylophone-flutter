import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.purple,
      Colors.red,
      Colors.brown,
      Colors.teal,
      Colors.blueGrey,
      Colors.black,
      Colors.green
    ];

    void playSound(int soundIndex) {
      final player = AudioPlayer();
      player.play(AssetSource("note$soundIndex.wav"));
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List<Widget>.generate(
              colors.length,
              (index) => createExpandedKey(
                playSound: () => playSound(index + 1),
                color: colors[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class createExpandedKey extends StatelessWidget {
  final Function() playSound;
  final Color color;

  createExpandedKey({
    Key? key,
    required this.playSound,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: playSound,
        child: Text(""),
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => color),
        ),
      ),
    );
  }
}

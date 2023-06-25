import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EidApp());
}

class EidApp extends StatelessWidget {
  const EidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true).copyWith(),
      title: 'Eid App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // link to generate image link : https://postimages.org/

  // take Direct link from website
  String your_image_url = '';
  // put your name
  String your_name = '';

  final player = AudioPlayer();

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9D4EDD),
        title: const Text(
          "GDSC Menofia",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF9D4EDD), Color(0xFF7B2CBF)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(your_image_url),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Happy Eid , $your_name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 18,
            ),
            OutlinedButton(
                onPressed: () async {
                  await player.stop();
                  await player.play(AssetSource('eid_sound.mp3'));
                },
                child: Text("Your message"))
          ],
        ),
      ),
    );
  }
}

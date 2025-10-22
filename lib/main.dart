import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: AvatarScreen()));
  }
}

class AvatarScreen extends StatefulWidget {
  const AvatarScreen({super.key});

  @override
  State<AvatarScreen> createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  File? riveFile;
  Artboard? artboard;
  StateMachinePainter? painter;

  @override
  void initState() {
    super.initState();

    File.asset(
      'anims/example_sound_issue_report.riv',
      riveFactory: Factory.rive,
    ).then((file) {
      setState(() {
        riveFile = file;

        artboard = riveFile!.artboard('artboard')!;

        painter = RivePainter.stateMachine();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Builder(
        builder: (context) {
          if (riveFile == null || artboard == null || painter == null) {
            return const SizedBox.shrink();
          }

          return RiveArtboardWidget(artboard: artboard!, painter: painter!);
        },
      ),
    );
  }
}

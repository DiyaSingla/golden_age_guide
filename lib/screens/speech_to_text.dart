import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VoiceRecordingPage(),
    );
  }
}

class VoiceRecordingPage extends StatefulWidget {
  const VoiceRecordingPage({super.key});

  @override
  _VoiceRecordingPageState createState() => _VoiceRecordingPageState();
}

class _VoiceRecordingPageState extends State<VoiceRecordingPage> {
  bool isListening = false;
  String recognizedText = 'Hold the icon and start speaking';

  SpeechToText speechToText = SpeechToText();

  @override
  void initState() {
    super.initState();
    initSpeechToText();
  }

  Future<void> initSpeechToText() async {
    bool available = await speechToText.initialize();
    if (available) {
      setState(() {
        isListening = false; // Set isListening to false initially
      });
    } else {
      // Handle the case where speech recognition is not available
      print('Speech recognition not available');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Recording Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              recognizedText,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onLongPress: () {
                startListening();
              },
              onLongPressUp: () {
                stopListening();
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isListening ? Colors.red : Colors.blue,
                ),
                child: Icon(
                  isListening ? Icons.mic : Icons.mic_none,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startListening() async {
    setState(() {
      isListening = true;
      speechToText.listen(
        onResult: (result) {
          setState(() {
            recognizedText =
                result.recognizedWords; // Update the recognized text
          });
        },
      );
      print(recognizedText);
    });
  }

  void stopListening() {
    setState(() {
      isListening = false;
    });

    speechToText.stop();
  }
}

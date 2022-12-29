import 'package:flutter/material.dart';
import 'package:live_streaming/contants.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: theme,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController streamIdController = TextEditingController();

  _jumpToLivePage({required String liveID, required bool isHost}) {
    if (streamIdController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a stream ID'),
        ),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LiveScreen(liveID: liveID, isHost: isHost),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZegoCloud Live Streaming', style: TextStyle(fontSize: 22)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Spacer(),
            TextField(
              controller: streamIdController,
              keyboardType: TextInputType.number,
              decoration: textFieldDecoration,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Go Live Now'),
                  onPressed: () => _jumpToLivePage(
                    liveID: streamIdController.text,
                    isHost: true,
                  ),
                ),
                ElevatedButton(
                  child: const Text('Watch a Stream'),
                  onPressed: () => _jumpToLivePage(
                    liveID: streamIdController.text,
                    isHost: false,
                  ),
                ),
              ],
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

class LiveScreen extends StatelessWidget {
  const LiveScreen({Key? key, required this.liveID, this.isHost = false}) : super(key: key);

  final bool isHost;
  final String liveID;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltLiveStreaming(
      appID: appId,
      appSign: appSign,
      userID: localUserID,
      userName: 'user_$localUserID',
      liveID: liveID,
      config: isHost
          ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
          : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
    );
  }
}

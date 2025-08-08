// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:learning_reverpod/routes/app_router.dart';

// final _appRouter = AppRouter();

// Future<void> main() async {
//   await dotenv.load(fileName: ".env");
//   runApp(ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       routerConfig: _appRouter.config(),
//       title: 'AutoRoute Demo',
//       theme: ThemeData.dark(),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laravel Reverb Chat',
      theme: ThemeData.dark(),
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late IO.Socket socket;
  final TextEditingController _messageController = TextEditingController();
  final List<String> messages = [];

  @override
  void initState() {
    super.initState();
    initSocket();
    connect();
  }

  void connect() async {
    try {
      final socket = await WebSocket.connect('ws://192.168.10.90:6001');

      socket.listen((data) {
        print('Received: $data');
      });

      socket.add('Hello server!');
    } catch (e) {
      print('Error: $e');
    }
  }

  void initSocket() {
    socket = IO.io('http://192.168.10.90:6001', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      'forceNew': true,
    });

    socket.onConnect((_) {
      print('Connected!');
    });

    socket.onConnectError((data) {
      print('Connect Error: $data');
    });

    socket.onError((data) {
      print('Error: $data');
    });

    socket.onDisconnect((_) {
      print('Disconnected');
    });
  }

  void sendMessage() {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;

    // Send message via your Laravel API (not WebSocket directly)
    // Placeholder: Simulate message send
    print('✉️ Sending message: $message');
    connect();
    _messageController.clear();

    // You’d usually call your Laravel API here with `http.post(...)`
  }

  @override
  void dispose() {
    socket.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Real-Time Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(messages[index])),
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(hintText: 'Type a message...'),
                  ),
                ),
                IconButton(icon: Icon(Icons.send), onPressed: sendMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

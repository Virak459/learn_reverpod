// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// Future<void> main() async {
//   await dotenv.load(fileName: '.env');
//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: ClientUrlScreen());
//   }
// }

// class ClientUrlScreen extends StatefulWidget {
//   const ClientUrlScreen({super.key});

//   @override
//   State<ClientUrlScreen> createState() => _ClientUrlScreenState();
// }

// class _ClientUrlScreenState extends State<ClientUrlScreen> {
//   String? clientUrl;

//   void loadClientUrl() {
//     final url = dotenv.env['CLIENT_URL'];
//     setState(() {
//       clientUrl = url;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Load Client URL')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               key: const Key('loadButton'), // 👈 key for testing
//               onPressed: loadClientUrl,
//               child: const Text('Load Client URL'),
//             ),
//             if (clientUrl != null) Text('Client URL: $clientUrl'),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:learning_reverpod/routes/app_router.dart';

final _appRouter = AppRouter();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'AutoRoute Demo',
      theme: ThemeData.dark(),
    );
  }
}

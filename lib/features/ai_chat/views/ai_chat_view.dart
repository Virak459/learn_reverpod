import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../providers/chat_provider.dart';
import 'package:flutter_ai_toolkit/flutter_ai_toolkit.dart';
import 'package:logger/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final logger = Logger();

@RoutePage()
class AIChatScreen extends ConsumerWidget {
  const AIChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSession = ref.watch(selectedSessionProvider);
    // final provider = ref.watch(geminiProvider);
    final provider = ref.watch(ai_localProvider);
    if (selectedSession.history.isNotEmpty) {
      provider.history = selectedSession.history;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Assistant'),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat),
            tooltip: 'Start New Chat',
            onPressed: () {
              logger.d('Chat button pressed');
              ref.read(geminiProvider).history = [];
              ref.invalidate(selectedSessionProvider);
            },
          ),
          // IconButton(
          //   icon: const Icon(Icons.history),
          //   tooltip: 'Show Sessions',
          //   onPressed: () {
          //     logger.d("history: ${provider.history}");
          //     showDialog(
          //       context: context,
          //       builder: (context) => const ChatSessionsDialog(),
          //     );
          //   },
          // ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Column(
            children: [
              Expanded(
                child: LlmChatView(
                  provider: provider,
                  enableAttachments: false,
                  enableVoiceNotes: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatSessionsDialog extends ConsumerWidget {
  const ChatSessionsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(localChatSessionsProvider);

    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Chat Sessions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            switch (sessionsAsync) {
              AsyncData(:final value) => Expanded(
                  child: ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      final session = value[index];
                      final formattedDate = DateFormat('MMM dd, yyyy - HH:mm')
                          .format(session.updatedAt);

                      // Get the first message if available
                      String? firstMessage;
                      if (session.history.isNotEmpty) {
                        final messages = session.history.toList();
                        final first = messages.first;
                        firstMessage = first.text;
                        if (firstMessage != null && firstMessage.length > 40) {
                          firstMessage = '${firstMessage.substring(0, 40)}...';
                        }
                      }

                      return ListTile(
                        selected:
                            ref.watch(selectedSessionProvider).id == session.id,
                        title: firstMessage != null
                            ? Text(
                                firstMessage,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            : Text(session.title),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formattedDate,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () {
                                ref.read(chatBoxProvider.future).then((box) {
                                  box.delete(session.id);
                                  ref.invalidate(localChatSessionsProvider);
                                  if (context.mounted) {
                                    if (Navigator.canPop(context)) {
                                      Navigator.pop(context);
                                    }
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        onTap: () {
                          ref
                              .read(selectedSessionProvider.notifier)
                              .setSession(session);
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                        },
                      );
                    },
                  ),
                ),
              AsyncValue(:final error?) =>
                Center(child: Text('Error loading sessions: $error')),
              _ => const Center(child: CircularProgressIndicator()),
            },
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

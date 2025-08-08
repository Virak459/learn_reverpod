import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:learning_reverpod/features/home/viewmodels/home_viewmodel.dart'
    as ChatMessageRole;
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
      // body: LlmChatView(
      //   provider: provider,
      //   enableAttachments: false,
      //   enableVoiceNotes: false,
      //   style: LlmChatViewStyle(
      //     llmMessageStyle: LlmMessageStyle(
      //       // markdownStyle: MarkdownStyleSheet.fromTheme(Theme.of(context).),
      //       decoration: BoxDecoration(
      //         // color: Colors.red,
      //         borderRadius: BorderRadius.circular(12),

      //         gradient: LinearGradient(
      //           colors: [
      //             const Color.fromARGB(255, 255, 255, 255),
      //             const Color.fromARGB(85, 181, 152, 152),
      //           ],
      //           begin: Alignment.topLeft,
      //           end: Alignment.bottomRight,
      //         ),
      //       ),
      //     ),
      //   ),
      //   responseBuilder: (context, m) {
      //     final isUser = m == ChatMessageRole.user;

      //     return Align(
      //       alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      //       child: Container(
      //         constraints: BoxConstraints(
      //           maxWidth: isUser
      //               ? MediaQuery.of(context).size.width *
      //                     0.6 // Limit user message width
      //               : MediaQuery.of(context).size.width, // Full width for AI
      //         ),
      //         margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      //         padding: const EdgeInsets.all(12),
      //         decoration: BoxDecoration(
      //           color: isUser ? Colors.blue.shade100 : Colors.grey.shade200,
      //           borderRadius: BorderRadius.circular(12),
      //         ),
      //         child: Text(
      //           m.toString() ?? '',
      //           style: const TextStyle(fontSize: 16),
      //         ),
      //       ),
      //     );
      //   },
      //   // responseBuilder: (context, message) {
      //   //   try {
      //   //     final Map<String, dynamic> parsed = jsonDecode(message);
      //   //     final String output = parsed['output'] ?? message;
      //   //     final List toolCalls = parsed['tool_calls'] ?? [];
      //   //     final chartData = parsed['chart'];

      //   //     final cleanedOutput = cleanHtmlBlock(output);

      //   //     if (chartData != null) {
      //   //       final String chartType = chartData['type'];
      //   //       final List<String> labels = List<String>.from(
      //   //         chartData['labels'] ?? [],
      //   //       );
      //   //       final List<double> values = List<num>.from(
      //   //         chartData['values'] ?? [],
      //   //       ).map((e) => e.toDouble()).toList();
      //   //       final String title = chartData['title'] ?? '';
      //   //       final String xAxisLabel = chartData['xAxisLabel'] ?? '';
      //   //       final String yAxisLabel = chartData['yAxisLabel'] ?? '';

      //   //       if (chartType == 'pie') {
      //   //         return Column(
      //   //           crossAxisAlignment: CrossAxisAlignment.start,
      //   //           children: [
      //   //             if (title.isNotEmpty)
      //   //               Padding(
      //   //                 padding: const EdgeInsets.all(8.0),
      //   //                 child: Text(
      //   //                   title,
      //   //                   style: const TextStyle(
      //   //                     fontSize: 18,
      //   //                     fontWeight: FontWeight.bold,
      //   //                   ),
      //   //                 ),
      //   //               ),
      //   //             SizedBox(
      //   //               height: 300,
      //   //               child: PieChart(
      //   //                 PieChartData(
      //   //                   sections: List.generate(values.length, (i) {
      //   //                     return PieChartSectionData(
      //   //                       value: values[i],
      //   //                       title: labels[i],
      //   //                       radius: 60,
      //   //                       titleStyle: const TextStyle(
      //   //                         fontSize: 12,
      //   //                         color: Colors.black,
      //   //                       ),
      //   //                     );
      //   //                   }),
      //   //                   sectionsSpace: 2,
      //   //                   centerSpaceRadius: 40,
      //   //                 ),
      //   //               ),
      //   //             ),
      //   //           ],
      //   //         );
      //   //       }

      //   //       if (chartType == 'bar') {
      //   //         final double barWidth = 16; // Wider bars
      //   //         final double chartWidth =
      //   //             MediaQuery.of(context).size.width * 2;

      //   //         return SizedBox(
      //   //           width: chartWidth,
      //   //           child: Column(
      //   //             crossAxisAlignment: CrossAxisAlignment.start,
      //   //             children: [
      //   //               if (title.isNotEmpty)
      //   //                 Padding(
      //   //                   padding: const EdgeInsets.all(8.0),
      //   //                   child: Text(
      //   //                     title,
      //   //                     style: const TextStyle(
      //   //                       fontSize: 18,
      //   //                       fontWeight: FontWeight.bold,
      //   //                     ),
      //   //                   ),
      //   //                 ),
      //   //               SizedBox(
      //   //                 height: 400,
      //   //                 child: SingleChildScrollView(
      //   //                   scrollDirection: Axis.horizontal,
      //   //                   child: Container(
      //   //                     width: chartWidth,
      //   //                     padding: const EdgeInsets.all(12.0),
      //   //                     child: BarChart(
      //   //                       BarChartData(
      //   //                         titlesData: FlTitlesData(
      //   //                           leftTitles: AxisTitles(
      //   //                             sideTitles: SideTitles(
      //   //                               showTitles: true,
      //   //                               reservedSize: 100,
      //   //                               getTitlesWidget: (value, meta) =>
      //   //                                   Text(
      //   //                                     value.toString(),
      //   //                                     style: const TextStyle(
      //   //                                       fontSize: 8,
      //   //                                     ),
      //   //                                   ),
      //   //                             ),
      //   //                           ),
      //   //                           bottomTitles: AxisTitles(
      //   //                             sideTitles: SideTitles(
      //   //                               showTitles: true,
      //   //                               interval: 1,
      //   //                               getTitlesWidget: (value, meta) {
      //   //                                 final index = value.toInt();
      //   //                                 if (index < 0 ||
      //   //                                     index >= labels.length) {
      //   //                                   return const SizedBox.shrink();
      //   //                                 }
      //   //                                 return Transform.rotate(
      //   //                                   angle: -0.8,
      //   //                                   child: Text(
      //   //                                     labels[index],
      //   //                                     style: const TextStyle(
      //   //                                       fontSize: 10,
      //   //                                     ),
      //   //                                   ),
      //   //                                 );
      //   //                               },
      //   //                             ),
      //   //                           ),
      //   //                         ),
      //   //                         barGroups: List.generate(values.length, (
      //   //                           i,
      //   //                         ) {
      //   //                           return BarChartGroupData(
      //   //                             x: i,
      //   //                             barRods: [
      //   //                               BarChartRodData(
      //   //                                 toY: values[i],
      //   //                                 width: barWidth,
      //   //                                 borderRadius:
      //   //                                     BorderRadius.circular(2),
      //   //                               ),
      //   //                             ],
      //   //                           );
      //   //                         }),
      //   //                         gridData: FlGridData(show: true),
      //   //                         borderData: FlBorderData(show: false),
      //   //                       ),
      //   //                     ),
      //   //                   ),
      //   //                 ),
      //   //               ),
      //   //               Padding(
      //   //                 padding: const EdgeInsets.symmetric(
      //   //                   horizontal: 12.0,
      //   //                 ),
      //   //                 child: Row(
      //   //                   mainAxisAlignment:
      //   //                       MainAxisAlignment.spaceBetween,
      //   //                   children: [
      //   //                     if (xAxisLabel.isNotEmpty) Text(xAxisLabel),
      //   //                     if (yAxisLabel.isNotEmpty) Text(yAxisLabel),
      //   //                   ],
      //   //                 ),
      //   //               ),
      //   //             ],
      //   //           ),
      //   //         );
      //   //       }
      //   //     }

      //   //     // HTML content rendering
      //   //     if (cleanedOutput.contains('<table') ||
      //   //         cleanedOutput.contains('<div') ||
      //   //         cleanedOutput.contains('<img')) {
      //   //       return Flexible(
      //   //         child: SingleChildScrollView(
      //   //           padding: const EdgeInsets.all(8),
      //   //           child: Html(data: cleanedOutput),
      //   //         ),
      //   //       );
      //   //     }

      //   //     // Markdown fallback
      //   //     return Container(
      //   //       color: Colors.grey[50],
      //   //       alignment: Alignment.centerRight,
      //   //       width: MediaQuery.of(context).size.width * 0.99,
      //   //       child: OutputWithDetails(
      //   //         output: cleanedOutput,
      //   //         toolCalls: toolCalls,
      //   //       ),
      //   //     );
      //   //   } catch (e) {
      //   //     print("Parse error: $e");
      //   //     return Flexible(child: SelectableText(message));
      //   //   }
      //   // },
      //   onErrorCallback: (context, error) {
      //     print("object $error\n\n\n");
      //   },
      // ),
      body: CustomChatScreen(),
    );
  }
}

String cleanHtmlBlock(String htmlText) {
  // Remove ```html and ``` blocks
  return htmlText
      .replaceAll(RegExp(r'```html\s*'), '')
      .replaceAll(RegExp(r'```'), '')
      .trim();
}

String convertHtmlImageToMarkdown(String response) {
  final regex = RegExp(r'src="(data:image\/[a-zA-Z]+;base64,[^"]+)"');
  final match = regex.firstMatch(response);

  if (match != null) {
    final imageUrl = match.group(1)!;
    final markdownImage = '![Chart Image]($imageUrl)';

    // Replace entire ```html block with markdown image
    final cleanResponse = response.replaceAll(
      RegExp(r'```html[\s\S]*?```'),
      markdownImage,
    );

    return cleanResponse.trim();
  }

  return response; // fallback to original if no image found
}

String preprocessHtmlToMarkdown(String html) {
  final regex = RegExp(r'src="data:image\/png;base64,([^"]+)"');
  final match = regex.firstMatch(html);
  if (match != null) {
    final base64 = match.group(1);
    return '![chart](data:image/png;base64,$base64)';
  }
  return html;
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            switch (sessionsAsync) {
              AsyncData(:final value) => Expanded(
                child: ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final session = value[index];
                    final formattedDate = DateFormat(
                      'MMM dd, yyyy - HH:mm',
                    ).format(session.updatedAt);

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
              AsyncValue(:final error?) => Center(
                child: Text('Error loading sessions: $error'),
              ),
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

class OutputWithDetails extends StatefulWidget {
  final String output;
  final List<dynamic> toolCalls;

  const OutputWithDetails({
    super.key,
    required this.output,
    required this.toolCalls,
  });

  @override
  _OutputWithDetailsState createState() => _OutputWithDetailsState();
}

class _OutputWithDetailsState extends State<OutputWithDetails> {
  bool _showDetails = false;

  bool get _containsHtml =>
      RegExp(r'\*>', caseSensitive: false).hasMatch(widget.output);
  // bool get _hasDatasetStructure {
  //   return widget.output.contains('Table Name') ||
  //       widget.output.contains('**Columns**') ||
  //       widget.output.contains('**Columns:**') ||
  //       widget.output.contains('_row_id') ||
  //       RegExp(r'-\s+[`_a-zA-Z0-9\s/]+:\s+\w+', caseSensitive: false)
  //           .hasMatch(widget.output);
  // }

  // bool get _containsMarkdown =>
  //     widget.output.contains('**') ||
  //     widget.output.contains('#') ||
  //     widget.output.contains('- ') ||
  //     widget.output.contains('```');

  bool get _isDatasetDefinition =>
      widget.output.contains('**Key Columns**') &&
      RegExp(r'-\s+\w+.*\([^)]+\)').hasMatch(widget.output);

  @override
  Widget build(BuildContext context) {
    Widget content;

    // if (_containsHtml) {
    //   print("Processing in dataset1\n");
    //   content = Html(data: widget.output);
    // }
    // // else if (_hasDatasetStructure) {
    // //   print("Processing in dataset2\n");
    // //   final datasets = parseDatasets(widget.output);
    // //   content = Container(
    // //     constraints:
    // //         BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
    // //     child: Column(
    // //       crossAxisAlignment: CrossAxisAlignment.start,
    // //       children: datasets.map((dataset) {
    // //         return Card(
    // //           color: Colors.grey.shade100,
    // //           margin: const EdgeInsets.symmetric(vertical: 8),
    // //           child: Padding(
    // //             padding: const EdgeInsets.all(12),
    // //             child: Column(
    // //               crossAxisAlignment: CrossAxisAlignment.start,
    // //               children: [
    // //                 Text('📊 ${dataset['name']}',
    // //                     style: const TextStyle(
    // //                         fontWeight: FontWeight.bold, fontSize: 16)),
    // //                 const SizedBox(height: 8),
    // //                 Text(dataset['description']),
    // //                 const SizedBox(height: 12),
    // //                 const Text('Columns:',
    // //                     style: TextStyle(fontWeight: FontWeight.bold)),
    // //                 const SizedBox(height: 6),
    // //                 Table(
    // //                     columnWidths: const {
    // //                       0: FlexColumnWidth(1),
    // //                       1: FlexColumnWidth(2)
    // //                     },
    // //                     border: TableBorder.all(color: Colors.grey),
    // //                     children: [
    // //                       ...dataset['columnsRaw']
    // //                           .toString()
    // //                           .trim()
    // //                           .split('\n')
    // //                           .where((line) => line.trim().startsWith('-'))
    // //                           .map((line) {
    // //                         final match = RegExp(
    // //                                 r'-\s+`?([^:`]+)`?\s*:\s*\(([^)]+)\)\s*-?\s*(.*)?')
    // //                             .firstMatch(line.trim());
    // //                         if (match != null) {
    // //                           return TableRow(children: [
    // //                             Padding(
    // //                               padding: const EdgeInsets.all(6),
    // //                               child: Text(match.group(1)?.trim() ?? '',
    // //                                   style: const TextStyle(
    // //                                       fontWeight: FontWeight.w500)),
    // //                             ),
    // //                             Padding(
    // //                               padding: const EdgeInsets.all(6),
    // //                               child: Text(
    // //                                   '${match.group(2)?.trim() ?? ''}${match.group(3)?.isNotEmpty == true ? ' - ${match.group(3)?.trim()}' : ''}'),
    // //                             ),
    // //                           ]);
    // //                         } else {
    // //                           return const TableRow(
    // //                               children: [Text('-'), Text('')]);
    // //                         }
    // //                       }),
    // //                     ]),
    // //               ],
    // //             ),
    // //           ),
    // //         );
    // //       }).toList(),
    // //     ),
    // //   );
    // // }
    // else if (_isDatasetDefinition) {
    //   print("Processing in dataset3\n");
    //   content = _buildDatasetTable(widget.output);
    // }
    // // else if (_containsMarkdown) {
    // //   print("Processing in dataset4\n");
    // //   content = MarkdownBody(data: widget.output);
    // // }
    // else {
    //   print("Processing in dataset5\n");
    //   // content =
    //   //     SelectableText(widget.output, style: const TextStyle(fontSize: 16));

    // }
    content = MarkdownBody(
      data: widget.output,
      // selectable: true,
      styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
        p: const TextStyle(fontSize: 16),
        tableHead: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          content,
          const SizedBox(height: 12),
          if (widget.toolCalls.isNotEmpty)
            TextButton(
              onPressed: () {
                setState(() {
                  _showDetails = !_showDetails;
                });
              },
              child: Text(_showDetails ? 'Hide Details' : 'More Details'),
            ),
          if (_showDetails)
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: widget.toolCalls.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final tool = widget.toolCalls[index];
                final String toolName = tool['tool_name'] ?? 'Unknown';
                final dynamic argsRaw = tool['args'];
                final dynamic args = _tryDecodeJson(argsRaw);
                final prettyArgs = const JsonEncoder.withIndent(
                  '  ',
                ).convert(args);

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '🛠 Tool: $toolName',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF2A3D5B), // your deep blue
                        ),
                      ),
                      const SizedBox(height: 8),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: ScrollController(initialScrollOffset: 0.5),
                        child: SelectableText(
                          prettyArgs,
                          style: const TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  dynamic _tryDecodeJson(dynamic input) {
    if (input is String) {
      try {
        return json.decode(input);
      } catch (_) {
        return input;
      }
    }
    return input;
  }

  /// Parses the dataset-style column list and renders a table.
  Widget _buildDatasetTable(String text) {
    final lines = text.split('\n');

    final columnLines = lines
        .skipWhile(
          (line) => !line.trim().startsWith('**Columns**'),
        ) // Skip until **Columns**
        .skip(1) // skip the **Columns** line itself
        .takeWhile((line) => line.trim().startsWith('-')) // Take column lines
        .toList();

    final rows = columnLines
        .map((line) {
          final match = RegExp(
            r'-\s+(\S+)\s+\(([^)]+)\)',
          ).firstMatch(line.trim());
          if (match != null) {
            return {'name': match.group(1)!, 'type': match.group(2)!};
          }
          return null;
        })
        .whereType<Map<String, String>>()
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Text('Columns:',
        //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        Table(
          columnWidths: const {0: IntrinsicColumnWidth(), 1: FlexColumnWidth()},
          border: TableBorder.all(color: Colors.grey),
          children: [
            const TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Text(
                    'Field Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Text(
                    'Type',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            ...rows.map(
              (row) => TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(row['name'] ?? ''),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(row['type'] ?? ''),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Map<String, dynamic>> parseDatasets(String text) {
    final datasetRegex = RegExp(
      r'(?=^\d+\.\s+\*\*(.*?)\*\*\s*$)', // Dataset start with "1. **Name**"
      multiLine: true,
    );

    final matches = datasetRegex.allMatches(text);
    final datasets = <Map<String, dynamic>>[];

    for (var i = 0; i < matches.length; i++) {
      final start = matches.elementAt(i).start;
      final end = (i + 1 < matches.length)
          ? matches.elementAt(i + 1).start
          : text.length;
      final section = text.substring(start, end).trim();

      final nameMatch = RegExp(r'\d+\.\s+\*\*(.*?)\*\*').firstMatch(section);
      final descMatch = RegExp(
        r'-\s+\*\*Description:\*\*\s*(.*?)\n',
        dotAll: true,
      ).firstMatch(section);
      final columnsMatch = RegExp(
        r'-\s+\*\*Columns:\*\*\s*\n((?:\s*-\s+.*\n?)+)',
        dotAll: true,
      ).firstMatch(section);

      datasets.add({
        'name': nameMatch?.group(1)?.trim() ?? 'Unknown Dataset',
        'description': descMatch?.group(1)?.trim() ?? '',
        'columnsRaw': columnsMatch?.group(1)?.trim() ?? '',
      });
    }

    return datasets;
  }
}

class LLMPreviewWidget extends StatelessWidget {
  final String markdownText;

  const LLMPreviewWidget({super.key, required this.markdownText});

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: markdownText,
      // Optionally wrap in SingleChildScrollView if you want scroll inside preview widget
      // child: SingleChildScrollView(child: Markdown(data: markdownText)),
      styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
        h1: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        p: const TextStyle(fontSize: 16),
        listBullet: const TextStyle(fontSize: 16),
      ),
    );
  }
}

// 2) Your Chat Screen (no history stored in the provider)
class CustomChatScreen extends ConsumerStatefulWidget {
  const CustomChatScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CustomChatScreen> createState() => _CustomChatScreenState();
}

class _CustomChatScreenState extends ConsumerState<CustomChatScreen> {
  final TextEditingController controller = TextEditingController();

  // Local list of messages
  final List<ChatMessage> _messages = [];

  void sendMessage(String text) {
    final prompt = text.trim();
    if (prompt.isEmpty) return;

    // 1) Add the user message
    setState(() {
      _messages.add(ChatMessage.user(prompt));
      // 2) Preflight an empty LLM message to be filled in
      _messages.add(ChatMessage.llm());
    });

    controller.clear();
    FocusScope.of(context).unfocus();

    // 3) Stream from your provider
    final stream = ref.read(ai_localProvider).sendMessageStream(prompt);
    stream.listen((chunk) {
      setState(() {
        // append to the last (LLM) message
        _messages.last.append(chunk);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Chat')),
      body: Column(
        children: [
          // 4) Message list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isUser = msg.role == Role.user;

                return Align(
                  alignment: isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: isUser
                        ? MediaQuery.of(context).size.width * 0.6
                        : MediaQuery.of(context).size.width * 0.9,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser
                          ? Colors.blue.shade100
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    // <-- Conditionally render based on role
                    child: isUser
                        ? GestureDetector(
                            onLongPress: () async {
                              await Clipboard.setData(
                                ClipboardData(text: msg.text),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Copied to clipboard'),
                                ),
                              );
                            },
                            child: Text(
                              msg.text,
                              style: const TextStyle(fontSize: 16),
                            ),
                          )
                        : CustomResponseWidget(message: msg.text),
                  ),
                );
              },
            ),
          ),

          // 5) Input bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        hintText: 'Type your message…',
                        border: InputBorder.none,
                      ),
                      onSubmitted: sendMessage,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () => sendMessage(controller.text),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 1) Your ChatMessage model
enum Role { user, llm }

class ChatMessage {
  final Role role;
  String text;

  ChatMessage({required this.role, required this.text});

  // factory for user‐typed messages
  factory ChatMessage.user(String text) {
    return ChatMessage(role: Role.user, text: text);
  }

  // factory for assistant/LLM messages
  factory ChatMessage.llm([String initial = '']) {
    return ChatMessage(role: Role.llm, text: initial);
  }

  // append new streamed text
  void append(String more) => text += more;
}

class CustomResponseWidget extends StatelessWidget {
  final String message;

  const CustomResponseWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    try {
      final Map<String, dynamic> parsed = jsonDecode(message);
      final String output = parsed['output'] ?? message;
      final List toolCalls = parsed['tool_calls'] ?? [];
      final chartData = parsed['chart'];

      final cleanedOutput = cleanHtmlBlock(output);

      if (chartData != null) {
        final String chartType = chartData['type'];
        final List<String> labels = List<String>.from(
          chartData['labels'] ?? [],
        );
        final List<double> values = List<num>.from(
          chartData['values'] ?? [],
        ).map((e) => e.toDouble()).toList();
        final String title = chartData['title'] ?? '';
        final String xAxisLabel = chartData['xAxisLabel'] ?? '';
        final String yAxisLabel = chartData['yAxisLabel'] ?? '';

        if (chartType == 'pie') {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              SizedBox(
                height: 300,
                child: PieChart(
                  PieChartData(
                    sections: List.generate(values.length, (i) {
                      return PieChartSectionData(
                        value: values[i],
                        title: labels[i],
                        radius: 60,
                        titleStyle: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      );
                    }),
                    sectionsSpace: 2,
                    centerSpaceRadius: 40,
                  ),
                ),
              ),
            ],
          );
        }

        if (chartType == 'bar') {
          final double barWidth = 16;
          final double chartWidth = MediaQuery.of(context).size.width * 2;

          return SizedBox(
            width: chartWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                SizedBox(
                  height: 400,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      width: chartWidth,
                      padding: const EdgeInsets.all(12.0),
                      child: BarChart(
                        BarChartData(
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 40,
                                getTitlesWidget: (value, meta) => Text(
                                  "${double.parse(value.toString()).toStringAsFixed(3)}",
                                  style: const TextStyle(fontSize: 8),
                                ),
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 1,
                                getTitlesWidget: (value, meta) {
                                  final index = value.toInt();
                                  if (index < 0 || index >= labels.length)
                                    return const SizedBox.shrink();
                                  return Transform.rotate(
                                    angle: -0.8,
                                    child: Text(
                                      labels[index],
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          barGroups: List.generate(values.length, (i) {
                            return BarChartGroupData(
                              x: i,
                              barRods: [
                                BarChartRodData(
                                  toY: values[i],
                                  width: barWidth,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ],
                            );
                          }),
                          gridData: FlGridData(show: true),
                          borderData: FlBorderData(show: false),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (xAxisLabel.isNotEmpty) Text(xAxisLabel),
                      if (yAxisLabel.isNotEmpty) Text(yAxisLabel),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }

      if (cleanedOutput.contains('<table') ||
          cleanedOutput.contains('<div') ||
          cleanedOutput.contains('<img')) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Html(data: cleanedOutput),
        );
      }

      return Container(
        alignment: Alignment.topLeft,
        width: MediaQuery.of(context).size.width * 2,
        child: Text(cleanedOutput),
      );
    } catch (e) {
      print("Parse error: $e");
      return SelectableText(message);
    }
  }

  String cleanHtmlBlock(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '').trim();
  }
}

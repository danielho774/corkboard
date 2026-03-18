import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardScreen extends ConsumerWidget {
  final String boardId;
  final String boardName;

  const BoardScreen({super.key, 
  required this.boardId, 
  required this.boardName});

  @override
  Widget build(BuildContext contect, WidgetRef ref) {
    return Scaffold (
      appBar: AppBar(
        title: Text(boardName)
      ),
    );
  }
}
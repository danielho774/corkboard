import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'board_header.dart';
import 'board_avatar_stack.dart';

const double HORIZONTAL_PADDING = 8;
const double VERTICAL_PADDING = 64;

class BoardScreen extends ConsumerWidget {
  final String boardId;
  final String boardName;
  final String boardLabel = "LABEL/TAG";
  final String description = "Hello, welcome to this group page. Scroll down to see what this group is about.";
  final int numUsers = 6;


  const BoardScreen({super.key, 
  required this.boardId, 
  required this.boardName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold (
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 50,   // tall when at the top
            pinned: true,          // shrinks but stays visible when scrolling
            flexibleSpace: FlexibleSpaceBar(
              title: Text(boardName),
            ),
            actions: [IconButton(icon: Icon(Icons.search), onPressed:()=>{}), IconButton(icon: Icon(Icons.more_vert),onPressed:()=>{})]
          ),
          SliverToBoxAdapter(         // ✅ converts a normal widget into a sliver
            child: Padding( 
              padding: const EdgeInsets.all(16.0),
              child: Column(            // Column is NOT a sliver — wrapped here
                children: [
                  BoardHeader(label: boardLabel, title: boardName, description: description, numUsers: numUsers),
                ],
              )
            ),
          ),
        ]
      )
    );
  }
}
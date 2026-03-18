import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'board_card.dart';
import '../data/board_repository.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final boardsAsync = ref.watch(boardsStreamProvider);

    void addBoard() {
        //Open Modal
    }

    return Scaffold(
      body: boardsAsync.when(
        data: (boards) => ListView.builder(
          itemCount: boards.length,
          itemBuilder: (context, index) => BoardCard(
            board: boards[index],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addBoard, 
        child: const Icon(Icons.add)
      )
    );
  }
}
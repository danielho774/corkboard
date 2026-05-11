import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../boards/presentation/board_card.dart';
import '../data/board_repository.dart';
import 'board_form_modal.dart';

const double HORIZONTAL_PADDING = 8;
const double VERTICAL_PADDING = 64;

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final boardsAsync = ref.watch(boardsStreamProvider);

    void openModal() {
        //Open Modal
        showModalBottomSheet(
          context: context, 
          builder: (BuildContext context) {
            return BoardFormModal();
          }
        );
    }

    return Scaffold(
      body: boardsAsync.when(
        data: (boards) => ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: HORIZONTAL_PADDING, vertical: VERTICAL_PADDING),
          itemCount: boards.length,
          itemBuilder: (context, index) => BoardCard(
            board: boards[index],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openModal, 
        child: const Icon(Icons.add)
      )
    );
  }
}
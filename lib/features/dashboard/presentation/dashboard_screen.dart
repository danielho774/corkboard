import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'board_card.dart';
import '../data/group_repository.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final groupsAsync = ref.watch(groupsStreamProvider);

    void addGroup() {
        //Open Modal
    }

    return Scaffold(
      body: groupsAsync.when(
        data: (groups) => ListView.builder(
          itemCount: groups.length,
          itemBuilder: (context, index) => GroupCard(
            group: groups[index],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addGroup, 
        child: const Icon(Icons.add)
      )
    );
  }
}
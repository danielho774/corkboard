import 'package:corkboard_flutter_app/features/dashboard/domain/board.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BoardCard extends StatelessWidget {
  final Board board;

  const BoardCard({super.key, required this.board});

  void handleSelected(String value) {
    // handle select from dropdown menu
    return;
  }

  @override
  Widget build(BuildContext context) {
    return (Card(
      clipBehavior: Clip.antiAlias, // Ensures the ripple stays inside the rounded corners
      child: InkWell(
        onTap: () => context.push('/board/${board.name}/${board.id}'), // Primary Action
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.group, size: 40, color: Theme.of(context).colorScheme.primary,),
                  // Secondary Action: The Ellipsis Menu
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert),
                    onSelected: (value) => handleSelected(value),
                    itemBuilder: (context) => [
                      const PopupMenuItem(value: 'edit', child: Text('Edit Board')),
                      const PopupMenuItem(value: 'delete', child: Text('Delete')),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                board.name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("${board.memberCount} Members"),
            ],
          ),
        ),
      ),
    ));
  }


}
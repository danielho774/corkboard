import 'package:flutter/material.dart';
import 'board_avatar_stack.dart';

class BoardHeader extends StatelessWidget {
  final String label;
  final String title;
  final String description;
  final int numUsers;

  const BoardHeader({super.key, 
  required this.label, 
  required this.title,
  required this.description,
  required this.numUsers});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Text(
          label, 
          style: Theme.of(context).textTheme.labelMedium,
        ),
        SizedBox(height:4),
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium
        ),
        SizedBox(height:8),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium
        ),
        SizedBox(height:16),
        BoardAvatarStack(numUsers: numUsers)
      ]
    );
  }
}

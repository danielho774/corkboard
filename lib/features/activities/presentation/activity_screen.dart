import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../domain/activity.dart';

class ActivityScreen extends ConsumerWidget {
  final String activityId;

  const ActivityScreen ({super.key, required this.activityId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final Activity activityAsync = ref.watch(activityById(activityId));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 50,   // tall when at the top
            pinned: true,          // shrinks but stays visible when scrolling
            flexibleSpace: FlexibleSpaceBar(
              title: Text(activityId)
              // title: Text(activityAsync.name),
            ),
            actions: [IconButton(icon: Icon(Icons.search), onPressed:()=>{}), IconButton(icon: Icon(Icons.more_vert),onPressed:()=>{})]
          ),
        ]
      )
    );
  }
}
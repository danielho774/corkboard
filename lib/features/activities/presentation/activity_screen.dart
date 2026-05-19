import 'package:corkboard_flutter_app/features/activities/data/activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/activity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ActivityScreen extends ConsumerWidget {
  final String activityId;

  const ActivityScreen ({super.key, required this.activityId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityAsync = ref.watch(activityByIdProvider(activityId));

    final isLoading = activityAsync.isLoading;
    final activity = activityAsync.asData?.value ?? Activity.placeholder();

    return Skeletonizer(
      enabled: isLoading, // ✅ toggles skeleton on/off automatically
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 50,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(activity.name),
              ),
              actions: [
                IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(activity.name, style: Theme.of(context).textTheme.displayMedium),
                    Text(activity.description),
                    Text(activity.location),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
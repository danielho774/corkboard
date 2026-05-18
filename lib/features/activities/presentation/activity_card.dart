import 'package:corkboard_flutter_app/features/activities/data/activity_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../domain/activity.dart';

class ActivityCard extends ConsumerStatefulWidget {
  final Activity activity;

  const ActivityCard({super.key, required this.activity});

  @override
  ConsumerState<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends ConsumerState<ActivityCard> {
  late Activity _activity; // local copy of activity to reflect UI changes

  @override
  void initState() {
    super.initState();
    _activity = widget.activity; // initialize from the passed in activitys
  }

  Future<void> _toggleLike() async {
    final updated = await ref
      .read(activityRepositoryProvider)
      .toggleLikes(_activity);

    setState(() => _activity = updated); // update local state to rebuild UI
  }

  Future<void> _toggleSaved() async {
    final updated = await ref
      .read(activityRepositoryProvider)
      .toggleSaved(_activity);
      

    setState(() => _activity = updated);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () => context.push('/activity/${_activity.id}'),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(_activity.imageUrl, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 8, right: 8,
                  child: Chip(label: Text('FEATURED')),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Row(
                    children: [
                      Text(_activity.name, style: Theme.of(context).textTheme.titleMedium),
                      Spacer(),
                      GestureDetector(
                        onTap: () {}, // absorbs tap so card doesn't navigate
                        child: IconButton(
                          onPressed: _toggleLike, // ✅ calls local method
                          icon: Icon(
                            _activity.isLiked ? Icons.favorite : Icons.favorite_border,
                            color: _activity.isLiked ? Colors.red : Colors.black,
                          ),
                        ),
                      ),
                      Text('${_activity.numLikes}'),
                      GestureDetector(
                        onTap: () {}, // absorbs tap so card doesn't navigate
                        child: IconButton(
                          onPressed: _toggleSaved, // ✅ calls local method
                          icon: Icon(
                            _activity.isSaved ? Icons.bookmark : Icons.bookmark_border,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(_activity.description, style: Theme.of(context).textTheme.bodySmall),
                  Row(children: [Icon(Icons.location_pin), Text(_activity.location)]),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _activity.tags.map((tag) =>
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Chip(label: Text(tag, style: Theme.of(context).textTheme.labelSmall)),
                        )
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
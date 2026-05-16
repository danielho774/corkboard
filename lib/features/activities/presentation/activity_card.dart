import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/activity.dart';

class ActivityCard extends ConsumerWidget {
  // TODO: Update to change based on state provider
  final Activity activity;

  const ActivityCard({super.key, 
    required this.activity
  });

  // String get imageUrl => 'https://picsum.photos/seed/$name/400/200';

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(activity.imageUrl, fit: BoxFit.cover),
              ),
              Positioned(
                top: 8, right: 8,
                child: Chip(label: Text('FEATURED')), // or Container with decoration
              ),
            ]
          ),
          // Card body
          Padding(
            padding:  const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                // header row
                Row(
                  children: [
                    Text(activity.name, style: Theme.of(context).textTheme.titleMedium),
                    Spacer(),
                    Icon(activity.isLiked ? Icons.favorite : Icons.favorite_border, color: activity.isLiked ? Colors.red : Colors.black), Text('${activity.numLikes}'),
                    Icon(Icons.bookmark),
                  ]
                ),

                // description
                Text(activity.description, style: Theme.of(context).textTheme.bodySmall),
                
                // location
                Row(children: [Icon(Icons.location_pin), Text(activity.location)]),
                
                // Tags
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // clipBehavior: Clip.hardEdge,
                    children: activity.tags.map((tag) => 
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Chip(label: Text(tag, style: Theme.of(context).textTheme.labelSmall)))
                    ).toList()
                  )
                )
              ]
            )
          )
        ]
      )
    );
  }
}
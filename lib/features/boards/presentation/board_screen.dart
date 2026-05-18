import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/board_header.dart';
import 'widgets/board_filter_bar.dart';
import '../../../core/providers/board_provider.dart';
import '../../activities/presentation/activity_card.dart';
import '../../activities/domain/activity.dart';
import '../../activities/data/activity_repository.dart';

const double HORIZONTAL_PADDING = 8;
const double VERTICAL_PADDING = 64;

class BoardScreen extends ConsumerWidget {
  // TODO: change these to all be pulled from API based on board ID
  final String boardId;
  final String boardName;
  final String _boardLabel = "LABEL/TAG";
  final String _description = "Hello, welcome to this group page. This is just placeholder text. Scroll down to see what this group is about.";
  final int _numUsers = 6;

  // TODO: add filter function to all activities button (ie. by likes, by cost, by distance)
  static const List<String> _filters = ["All Activities", "LA", "Cali", "Summer", "Spring", "Favorites"];

  const BoardScreen({super.key, 
  required this.boardId, 
  required this.boardName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilters = ref.watch(filterProvider);
    final activitiesAsync = ref.watch(activitiesStreamProvider);

    final Activity exampleActivity = Activity(
      id: 'some_uuid',
      name: 'Example Activity', 
      location: 'Somewhere, US',
      isLiked: true,
      isSaved: true,
      tags: ['tag 1', '\$\$', 'fun', 'super duper uber long tag'],
      numLikes: 7,
      description: 'This is an example activity. If you click an activity card, it will lead you to the activity page where you can view all the links and information associated with the activity.',
    );    

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ // All page components are here

                  // header info
                  BoardHeader(label: _boardLabel, title: boardName, description: _description, numUsers: _numUsers),
                  SizedBox(height:48), // spacer

                  // filter bar
                  BoardFilterBar(filters: _filters,),
                  SizedBox(height:48), // spacer
                ],
              )
            ),
          ),

          // Activities list — as a sliver, no height conflict
          activitiesAsync.when(
            data: (activities) => SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: HORIZONTAL_PADDING),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ActivityCard(activity: activities[index]),
                  ),
                  childCount: activities.length,
                ),
              ),
            ),
            loading: () => SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (err, stack) => SliverToBoxAdapter(
              child: Center(child: Text('Error: $err')),
            ),
          ),
        ]
      )
    );
  }
}
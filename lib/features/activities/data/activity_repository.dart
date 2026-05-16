import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/activity.dart';
import 'package:uuid/uuid.dart';

part 'activity_repository.g.dart';

class ActivityRepository {
  // TODO: connect to FastAPI or PostgresSQL API

  // A stream that mimics a database update every 5 seconds
  Stream<List<Activity>> watchActivities() async* {
    var ActivityList = [
      Activity(
        id: const Uuid().v4(), 
        name: 'Example Activity 1', 
        location: 'Somewhere, US',
        isLiked: true,
        tags: ['tag 1', '\$\$', 'fun', 'super duper uber long tag'],
        numLikes: 7,
        description: 'This is an example activity. If you click an activity card, it will lead you to the activity page where you can view all the links and information associated with the activity.',
      ),
      Activity(
        id: const Uuid().v4(), 
        name: 'Example Activity 2', 
        location: 'Somewhere, US',
        isLiked: true,
        tags: ['tag 1', '\$\$', 'fun', 'super duper uber long tag'],
        numLikes: 7,
        description: 'This is an example activity. If you click an activity card, it will lead you to the activity page where you can view all the links and information associated with the activity.',
      ),
    ];

    yield ActivityList;
    
    await Future.delayed(const Duration(seconds: 5));
    
    ActivityList.add(Activity(
        id: const Uuid().v4(), 
        name: 'Example Activity 3', 
        location: 'Somewhere, US',
        isLiked: true,
        tags: ['tag 1', '\$\$', 'fun', 'super duper uber long tag'],
        numLikes: 7,
        description: 'This is an example activity. If you click an activity card, it will lead you to the activity page where you can view all the links and information associated with the activity.',
      ));

    // Simulate a new Activity being added remotely
    yield [...ActivityList];
  }

  // Create a new Activity
  Future<Activity> createActivity(ActivityEntry ActivityEntry) async {
    await Future.delayed(const Duration(seconds: 2));
    final uuid = Uuid().v4();

    Activity createdActivity = Activity(
      id: uuid, 
      name: ActivityEntry.name,
      location: ActivityEntry.location,
      isLiked: ActivityEntry.isLiked,
      tags: ActivityEntry.tags,
      numLikes: ActivityEntry.numLikes,
      description: ActivityEntry.description,
    );

    return createdActivity;
  }   
}

@riverpod
ActivityRepository activityRepository(Ref ref) => ActivityRepository();

@riverpod
Stream<List<Activity>> activitiesStream(Ref ref) {
  return ref.watch(activityRepositoryProvider).watchActivities();
}
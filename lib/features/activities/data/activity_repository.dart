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
        isSaved: true,
        tags: ['tag 1', '\$\$', 'fun', 'super duper uber long tag'],
        numLikes: 7,
        description: 'This is an example activity. If you click an activity card, it will lead you to the activity page where you can view all the links and information associated with the activity.',
      ),
      Activity(
        id: const Uuid().v4(), 
        name: 'Example Activity 2', 
        location: 'Somewhere, US',
        isLiked: true,
        isSaved: false,
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
        isSaved: true,
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
      isSaved: ActivityEntry.isSaved,
      tags: ActivityEntry.tags,
      numLikes: ActivityEntry.numLikes,
      description: ActivityEntry.description,
    );

    return createdActivity;
  }   

  Future<Activity> fetchActivity(String id) async {
    // TODO: replace with real API call e.g:
    // final response = await http.get(Uri.parse('https://yourapi.com/activities/$id'));
    // return Activity.fromJson(jsonDecode(response.body));

    // Mock implementation for now
    await Future.delayed(const Duration(seconds: 1)); // simulate network delay

    // Simulated fetch by id
    final mockActivities = [
      Activity(
        id: id,
        name: 'Fetched Activity',
        location: 'Somewhere, US',
        isLiked: true,
        isSaved: true,
        tags: ['tag 1', '\$\$', 'fun'],
        numLikes: 3,
        description: 'This activity was fetched by id.',
      ),
    ];

    final activity = mockActivities.firstWhere(
      (a) => a.id == id,
      orElse: () => throw Exception('Activity $id not found'),
    );

    return activity;
  }

  Future<Activity> toggleLikes(Activity a ) async {
    /*TODO: change to id when database is integrated*/
    
    final Activity newActivity = Activity(
      id: a.id,
      name: a.name,
      location: a.location,
      isLiked: !a.isLiked,
      isSaved: a.isSaved,
      tags: a.tags,
      numLikes: a.isLiked ? a.numLikes - 1 : a.numLikes + 1,
      description: a.description,
    );

    return newActivity;
  }

  Future<Activity> toggleSaved(Activity a ) async {
    /*TODO: change to id when database is integrated*/
    
    final Activity newActivity = Activity(
      id: a.id,
      name: a.name,
      location: a.location,
      isLiked: a.isLiked,
      isSaved: !a.isSaved,
      tags: a.tags,
      numLikes: a.numLikes,
      description: a.description,
    );

    return newActivity;
  }
}

@riverpod
ActivityRepository activityRepository(Ref ref) => ActivityRepository();

@riverpod
Stream<List<Activity>> activitiesStream(Ref ref) {
  return ref.watch(activityRepositoryProvider).watchActivities();
}

@riverpod
Future<Activity> activityById(Ref ref, String id) {
  return ref.watch(activityRepositoryProvider).fetchActivity(id);
}
class Activity {
  final String id;
  final String name;
  final String location;
  final int numLikes;
  final bool isLiked;
  final bool isSaved;
  final List<String> tags;
  final String description;

  const Activity({
    required this.id,
    required this.name,
    required this.location,
    required this.numLikes,
    required this.isLiked,
    required this.isSaved,
    required this.tags,
    required this.description,
  });

  String get imageUrl => 'https://picsum.photos/seed/$name/400/200';

  factory Activity.placeholder() => Activity(
    id: '0',
    name: 'Placeholder Activity',
    location: 'NoWhere, USA',
    numLikes: 0,
    isLiked: false,
    isSaved: false,
    tags: ['\$'],
    description: 'This is a placeholder activity. Use this for skeleton loaders. Not representative of a real activity.',
  );
  
}

class ActivityEntry {
  final String name;
  final String location;
  final int numLikes;
  final bool isLiked;
  final bool isSaved;
  final List<String> tags;
  final String description;

  const ActivityEntry({
    required this.name,
    required this.location,
    required this.numLikes,
    required this.isLiked,
    required this.isSaved,
    required this.tags,
    required this.description,
  });
}
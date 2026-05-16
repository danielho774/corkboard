class Activity {
  final String id;
  final String name;
  final String location;
  final int numLikes;
  final bool isLiked;
  final List<String> tags;
  final String description;

  const Activity({
    required this.id,
    required this.name,
    required this.location,
    required this.numLikes,
    required this.isLiked,
    required this.tags,
    required this.description,
  });

  String get imageUrl => 'https://picsum.photos/seed/$name/400/200';

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      name: json['name'] ?? "",
      location: json['location'] ?? "",
      numLikes: json['num_likes'] ?? 0,
      isLiked: json['is_liked'] ?? false,
      tags: List<String>.from(json['tags'] ?? [""]),
      description: json['description'] ?? "",
      // imageUrl: json['image_url'] ?? "",
    );
  }

  // To send to API
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'num_likes': numLikes,
      'is_liked': isLiked,
      'tags': tags,
      'description': description,
      'image_url': imageUrl,
    };
  }
}

class ActivityEntry {
  final String name;
  final String location;
  final int numLikes;
  final bool isLiked;
  final List<String> tags;
  final String description;

  const ActivityEntry({
    required this.name,
    required this.location,
    required this.numLikes,
    required this.isLiked,
    required this.tags,
    required this.description,
  });
}
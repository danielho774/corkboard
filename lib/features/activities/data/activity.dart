class Activity {
  final String name;
  final String location;
  final int numLikes;
  final bool isLiked;
  final List<String> tags;
  final String description;
  final String imageUrl;

  const Activity({
    required this.name,
    required this.location,
    required this.numLikes,
    required this.isLiked,
    required this.tags,
    required this.description,
    required this.imageUrl,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      name: json['name'] ?? "",
      location: json['location'] ?? "",
      numLikes: json['num_likes'] ?? 0,
      isLiked: json['is_liked'] ?? false,
      tags: List<String>.from(json['tags'] ?? [""]),
      description: json['description'] ?? "",
      imageUrl: json['image_url'] ?? "",
    );
  }

  // To send to API
  Map<String, dynamic> toJson() {
    return {
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
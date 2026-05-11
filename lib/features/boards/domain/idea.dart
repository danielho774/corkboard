class Idea {
  final String name;
  final String imageURL;
  final String country;
  final String city;
  final List<String>? likedby; //Optional: user ids that like this idea

  Idea({
    required this.name, 
    required this.imageURL, 
    required this.country,
    required this.city, 
    this.likedby});
}
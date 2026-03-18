
class Group {
  final String id;
  final String name;
  final int memberCount;
  final List<String> members; //TODO: create user objects for member data
  final String? imageURL;

  Group({
    required this.id,
    required this.name,
    required this.members,
    this.imageURL,
  }) : memberCount = members.length;
}
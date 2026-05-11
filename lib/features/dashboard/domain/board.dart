import 'package:uuid/uuid.dart';

class Board {
  final String id;
  final String name;
  final int memberCount;
  final List<String> members; //TODO: create user objects for member data
  final String? imageURL;

  Board({
    required this.id,
    required this.name,
    required this.members,
    this.imageURL,
  }) : memberCount = members.length;
}

class BoardEntry {
  final String name;
  final int memberCount;
  final List<String> members; //TODO: create user objects for member data
  final String? imageURL;

  BoardEntry({
    required this.name,
    required this.members,
    this.imageURL,
  }) : memberCount = members.length;
}
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/group.dart';

part 'group_repository.g.dart';

class GroupRepository {
  // A stream that mimics a database update every 5 seconds
  Stream<List<Group>> watchGroups() async* {
    yield [
      Group(id: '1', name: 'Camping', members: ["Donald", "Daisy"]),
      Group(id: '2', name: 'LA Eats', members: ["Mickey", "Minnie"]),
    ];
    
    await Future.delayed(const Duration(seconds: 5));
    
    // Simulate a new group being added remotely
    yield [
      Group(id: '1', name: 'Camping', members: ["Donald", "Daisy"]),
      Group(id: '2', name: 'LA Eats', members: ["Mickey", "Minnie"]),
      Group(id: '3', name: 'NBA Fantasy', members: ["Steph", "KD", "Lebron"]), //
    ];
  }
}

@riverpod
GroupRepository groupRepository(Ref ref) => GroupRepository();

@riverpod
Stream<List<Group>> groupsStream(Ref ref) {
  return ref.watch(groupRepositoryProvider).watchGroups();
}
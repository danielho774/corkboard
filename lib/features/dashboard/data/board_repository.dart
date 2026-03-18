import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/board.dart';

part 'board_repository.g.dart';

class  BoardRepository {
  // TODO: connect to FastAPI or PostgresSQL API

  // A stream that mimics a database update every 5 seconds
  Stream<List<Board>> watchBoards() async* {
    yield [
      Board(id: '1', name: 'Camping', members: ["Donald", "Daisy"]),
      Board(id: '2', name: 'LA Eats', members: ["Mickey", "Minnie"]),
    ];
    
    await Future.delayed(const Duration(seconds: 5));
    
    // Simulate a new Board being added remotely
    yield [
      Board(id: '1', name: 'Camping', members: ["Donald", "Daisy"]),
      Board(id: '2', name: 'LA Eats', members: ["Mickey", "Minnie"]),
      Board(id: '3', name: 'NBA Fantasy', members: ["Steph", "KD", "Lebron"]), //
    ];
  }
}

@riverpod
BoardRepository boardRepository(Ref ref) => BoardRepository();

@riverpod
Stream<List<Board>> boardsStream(Ref ref) {
  return ref.watch(boardRepositoryProvider).watchBoards();
}
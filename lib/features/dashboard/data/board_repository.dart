import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/board.dart';
import 'package:uuid/uuid.dart';

part 'board_repository.g.dart';

class  BoardRepository {
  // TODO: connect to FastAPI or PostgresSQL API

  // A stream that mimics a database update every 5 seconds
  Stream<List<Board>> watchBoards() async* {
    var boardList = [
      Board(id: const Uuid().v4(), name: 'Camping', members: ["Donald", "Daisy"]),
      Board(id: const Uuid().v4(), name: 'LA Eats', members: ["Mickey", "Minnie"]),
    ];

    yield boardList;
    
    await Future.delayed(const Duration(seconds: 5));
    
    boardList.add(Board(id: const Uuid().v4(), name: 'NBA Fantasy', members: ["Steph", "KD", "Lebron"]));

    // Simulate a new Board being added remotely
    yield [...boardList];
  }

  // Create a new Board
  Future<Board> createBoard(BoardEntry boardEntry) async {
    await Future.delayed(const Duration(seconds: 2));
    final uuid = Uuid().v4();

    Board createdBoard = Board(
      id: uuid, 
      name: boardEntry.name,
      members: boardEntry.members,
    );

    return createdBoard;
  }   
}

@riverpod
BoardRepository boardRepository(Ref ref) => BoardRepository();

@riverpod
Stream<List<Board>> boardsStream(Ref ref) {
  return ref.watch(boardRepositoryProvider).watchBoards();
}
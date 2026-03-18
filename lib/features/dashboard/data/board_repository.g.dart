// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(boardRepository)
const boardRepositoryProvider = BoardRepositoryProvider._();

final class BoardRepositoryProvider
    extends
        $FunctionalProvider<BoardRepository, BoardRepository, BoardRepository>
    with $Provider<BoardRepository> {
  const BoardRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'boardRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$boardRepositoryHash();

  @$internal
  @override
  $ProviderElement<BoardRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BoardRepository create(Ref ref) {
    return boardRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BoardRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BoardRepository>(value),
    );
  }
}

String _$boardRepositoryHash() => r'd3584b15a38c17686b6e3296fe3a4ec841176118';

@ProviderFor(boardsStream)
const boardsStreamProvider = BoardsStreamProvider._();

final class BoardsStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Board>>,
          List<Board>,
          Stream<List<Board>>
        >
    with $FutureModifier<List<Board>>, $StreamProvider<List<Board>> {
  const BoardsStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'boardsStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$boardsStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<Board>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Board>> create(Ref ref) {
    return boardsStream(ref);
  }
}

String _$boardsStreamHash() => r'2b71731d5429634487042203d8af4de3933bb2fd';

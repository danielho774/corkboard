// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(activityRepository)
const activityRepositoryProvider = ActivityRepositoryProvider._();

final class ActivityRepositoryProvider
    extends
        $FunctionalProvider<
          ActivityRepository,
          ActivityRepository,
          ActivityRepository
        >
    with $Provider<ActivityRepository> {
  const ActivityRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activityRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activityRepositoryHash();

  @$internal
  @override
  $ProviderElement<ActivityRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ActivityRepository create(Ref ref) {
    return activityRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ActivityRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ActivityRepository>(value),
    );
  }
}

String _$activityRepositoryHash() =>
    r'7c1737e126cc45b4a56c29b4a47ec6c020879d11';

@ProviderFor(activitiesStream)
const activitiesStreamProvider = ActivitiesStreamProvider._();

final class ActivitiesStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Activity>>,
          List<Activity>,
          Stream<List<Activity>>
        >
    with $FutureModifier<List<Activity>>, $StreamProvider<List<Activity>> {
  const ActivitiesStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activitiesStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activitiesStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<Activity>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Activity>> create(Ref ref) {
    return activitiesStream(ref);
  }
}

String _$activitiesStreamHash() => r'1f9bb603337036e35ed20c856b834f780d7b401e';

@ProviderFor(activityById)
const activityByIdProvider = ActivityByIdFamily._();

final class ActivityByIdProvider
    extends
        $FunctionalProvider<AsyncValue<Activity>, Activity, FutureOr<Activity>>
    with $FutureModifier<Activity>, $FutureProvider<Activity> {
  const ActivityByIdProvider._({
    required ActivityByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'activityByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$activityByIdHash();

  @override
  String toString() {
    return r'activityByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Activity> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Activity> create(Ref ref) {
    final argument = this.argument as String;
    return activityById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ActivityByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$activityByIdHash() => r'88ebf2dde7fd57486e9858645ed462cc7f5adb3a';

final class ActivityByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Activity>, String> {
  const ActivityByIdFamily._()
    : super(
        retry: null,
        name: r'activityByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ActivityByIdProvider call(String id) =>
      ActivityByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'activityByIdProvider';
}

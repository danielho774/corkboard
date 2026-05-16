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

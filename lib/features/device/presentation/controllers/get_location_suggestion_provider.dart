import 'package:litenet/features/device/data/di/usecase_provider.dart';
import 'package:litenet/features/device/domain/entities/map_location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_location_suggestion_provider.g.dart';

@riverpod
class GetLocationSuggestion extends _$GetLocationSuggestion {
  @override
  FutureOr<MapLocationResponse?> build() async {
    return null;
  }

  Future<void> fetchLocationSuggestion({required String query}) async {
    state = const AsyncValue.loading();

    final usecase = ref.read(getLocationSuggestionUsecaseProvider);
    final result = await usecase.call(query: query);

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (data) {
        state = AsyncValue.data(data);
      },
    );
  }
}

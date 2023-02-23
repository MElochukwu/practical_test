import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../class/time_sate.dart';

final timeProvider = StateNotifierProvider<TimeNotifier, TimeState>((ref) {
  return TimeNotifier();
});

class TimeNotifier extends StateNotifier<TimeState> {
  TimeNotifier()
      : super(TimeState(
          collectionMorningVal: 'Select time',
          collectionAfternoonVal: 'Select time',
          deliveryAfternoonVal: 'Select time',
          deliveryMorningVal: 'Select time',
        ));

  void onChangedCollectionMorningVal(String? newValue) {
    state = state.copyWith(collectionMorningVal: newValue);
  }

  void onChangedCollectionAfternoonVal(String? newValue) {
    state = state.copyWith(collectionAfternoonVal: newValue);
  }

  void onChangedDelvieryAfternoonVal(String? newValue) {
    state = state.copyWith(deliveryAfternoonVal: newValue);
  }

  void onChangedDeliveryMorningVal(String? newValue) {
    state = state.copyWith(deliveryMorningVal: newValue);
  }
}

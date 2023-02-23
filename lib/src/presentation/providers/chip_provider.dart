import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../class/chip_widget_state.dart';

final chipWidgetProvider =
    StateNotifierProvider<ChipWidgetNotifier, ChipWidgetState>((ref) {
  return ChipWidgetNotifier();
});

class ChipWidgetNotifier extends StateNotifier<ChipWidgetState> {
  ChipWidgetNotifier()
      : super(const ChipWidgetState(collectionIndex: 0, deliveryIndex: 0));

  void onCollectionChipSelected(bool value, int i) {
    state = state.copyWith(collectionIndex: i);
  }

  void onDeliveryChipSelected(bool value, int i) {
    state = state.copyWith(deliveryIndex: i);
  }
}

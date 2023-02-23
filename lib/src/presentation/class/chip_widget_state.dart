class ChipWidgetState {
  final int collectionIndex;
  final int deliveryIndex;

  const ChipWidgetState({
    required this.collectionIndex,
    required this.deliveryIndex,
  });

  ChipWidgetState copyWith({int? collectionIndex, int? deliveryIndex}) {
    return ChipWidgetState(
      collectionIndex: collectionIndex ?? this.collectionIndex,
      deliveryIndex: deliveryIndex ?? this.deliveryIndex,
    );
  }
}

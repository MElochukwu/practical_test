class TimeState {
  final String collectionMorningVal;
  final String collectionAfternoonVal;
  final String deliveryMorningVal;
  final String deliveryAfternoonVal;

  TimeState({
    required this.collectionMorningVal,
    required this.collectionAfternoonVal,
    required this.deliveryMorningVal,
    required this.deliveryAfternoonVal,
  });

  TimeState copyWith({
    String? collectionMorningVal,
    String? collectionAfternoonVal,
    String? deliveryAfternoonVal,
    String? deliveryMorningVal,
  }) =>
      TimeState(
        collectionMorningVal: collectionMorningVal ?? this.collectionMorningVal,
        collectionAfternoonVal:
            collectionAfternoonVal ?? this.collectionAfternoonVal,
        deliveryAfternoonVal: deliveryAfternoonVal ?? this.deliveryAfternoonVal,
        deliveryMorningVal: deliveryMorningVal ?? this.deliveryMorningVal,
      );
}

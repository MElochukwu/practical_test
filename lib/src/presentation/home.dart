import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practical_test/src/presentation/providers/chip_provider.dart';
import 'package:practical_test/src/presentation/reusable_widget/choice_chip.dart';

import 'providers/time_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        backgroundColor: Colors.grey[200],
        title: const Text(
          'Collection & Delivery Date',
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Collection Date & Time
          ///
          const SizedBox(height: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Select Collection Date & Time',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
              const SizedBox(height: 16),
              Consumer(builder: (context, ref, child) {
                return ChoiceChipWidget(
                  onSelected: (value, i) => ref
                      .read(chipWidgetProvider.notifier)
                      .onDeliveryChipSelected(value, i),
                  selected: ref.watch(chipWidgetProvider).deliveryIndex,
                );
              }),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildDayTime(
                        items: morningTimeItems,
                        title: 'Morning',
                        value: ref.watch(timeProvider).collectionMorningVal,
                        onChanged:
                            (ref.watch(timeProvider).collectionAfternoonVal !=
                                    'Select time')
                                ? null
                                : ref
                                    .read(timeProvider.notifier)
                                    .onChangedCollectionMorningVal,
                      ),
                      buildDayTime(
                        items: afternoonTimeItem,
                        title: 'Afternoon',
                        value: ref.watch(timeProvider).collectionAfternoonVal,
                        onChanged:
                            (ref.watch(timeProvider).collectionMorningVal !=
                                    'Select time')
                                ? null
                                : ref
                                    .read(timeProvider.notifier)
                                    .onChangedCollectionAfternoonVal,
                      ),
                    ],
                  );
                },
              ),

              /// Delivery Widgets
              ///
              ///
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Select Delivery Date & Time',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Consumer(
                    builder: (context, ref, child) {
                      return ChoiceChipWidget(
                        onSelected: (value, i) => ref
                            .read(chipWidgetProvider.notifier)
                            .onCollectionChipSelected(value, i),
                        selected: ref.watch(chipWidgetProvider).collectionIndex,
                      );
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Consumer(
                    builder: (context, ref, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildDayTime(
                            items: morningTimeItems,
                            title: 'Morning',
                            value: ref.watch(timeProvider).deliveryMorningVal,
                            onChanged:
                                (ref.watch(timeProvider).deliveryAfternoonVal !=
                                        'Select time')
                                    ? null
                                    : ref
                                        .read(timeProvider.notifier)
                                        .onChangedDeliveryMorningVal,
                          ),
                          buildDayTime(
                            items: afternoonTimeItem,
                            title: 'Afternoon',
                            value: ref.watch(timeProvider).deliveryAfternoonVal,
                            onChanged:
                                (ref.watch(timeProvider).deliveryMorningVal !=
                                        'Select time')
                                    ? null
                                    : ref
                                        .read(timeProvider.notifier)
                                        .onChangedDelvieryAfternoonVal,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Text(
              'Note: A delivery charge of £3.00 will be incurred for a full service',
              textAlign: TextAlign.center,
              // TextStyle(),
            ),
          ),
        ],
      ),
      bottomSheet: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {},
            child: const Text(
              'Continue',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  final morningTimeItems = [
    'Select time',
    '7:00am - 8:00am',
    '8:00am - 9:00am',
    '9:00am - 10:00am',
    '10:00am - 11:00am',
  ];

  final afternoonTimeItem = [
    'Select time',
    '12:00pm - 1:00pm',
    '1:00pm - 2:00pm',
    '2:00pm - 3:00pm',
    '3:00pm - 4:00pm',
  ];

  Widget buildDayTime({
    required List<String> items,
    required String title,
    required String value,
    required void Function(String?)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.grey, fontSize: 16.0),
        ),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
          ),
          child: DropdownButton<String>(
            items: items.map(
              (e) {
                final initialColor =
                    (e.contains('Select time')) ? Colors.grey : Colors.black;
                return DropdownMenuItem<String>(
                  value: e,
                  child: Text(
                    e,
                    style: TextStyle(color: initialColor),
                  ),
                );
              },
            ).toList(),
            underline: const SizedBox(),
            value: value,
            onChanged: onChanged,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ],
    );
  }
}

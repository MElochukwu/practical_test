import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ChoiceChipWidget extends StatelessWidget {
  final void Function(bool, int) onSelected;
  final int selected;
  ChoiceChipWidget({
    Key? key,
    required this.onSelected,
    required this.selected,
  }) : super(key: key);

  final chipLabels = ['Today', 'Tomorrow', 'Select Date'];

  String getDate() {
    final date = DateFormat('dd').format(DateTime.now());
    return date;
  }

  @override
  Widget build(BuildContext context) {
    Widget buildDateChips() {
      List<Widget> widget = [];
      for (var i = 0; i < chipLabels.length; i++) {
        final chips = Consumer(builder: (context, ref, child) {
          return RawChip(
            side: BorderSide.none,
            // elevation: 5,
            backgroundColor: Colors.white,
            selected: selected == i,
            selectedColor: Colors.blue,
            onSelected:(value) => onSelected(value, i),
            // (value) => ref
            //     .read(chipWidgetProvider.notifier)
            //     .onCollectionChipSelected(value, i),
            label: Column(
              children: [
                Text(
                  chipLabels[i],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: selected == i ? Colors.white : Colors.grey,
                  ),
                ),
                Text(
                  (i == 0)
                      ? DateFormat('dd MMM').format(DateTime.now())
                      : (i == 1)
                          ? DateFormat('dd MMM').format(
                              DateTime.now().add(
                                const Duration(days: 1),
                              ),
                            )
                          : DateFormat('dd MMM').format(
                              DateTime.now().add(
                                const Duration(days: 2),
                              ),
                            ),
                  style: TextStyle(
                    fontSize: 15,
                    color: selected == i
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            labelPadding: const EdgeInsets.symmetric(horizontal: 16),
            showCheckmark: false,
          );
        });
        widget.add(chips);
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget,
      );
    }

    return buildDateChips();
  }
}

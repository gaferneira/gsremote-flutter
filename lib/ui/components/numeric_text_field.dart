import 'package:flutter/material.dart';

class NumericTextField extends StatelessWidget {
  final int initialValue;
  final int? maxValue;
  final int? minValue;
  final String title;
  final String? metricUnit;
  final ValueChanged<int> onChanged;

  const NumericTextField({super.key,
    required this.initialValue,
    required this.title,
    required this.onChanged,
    this.maxValue,
    this.minValue,
    this.metricUnit
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _showNumberPicker(
          context,
          initialValue,
          minValue ?? 0,
          maxValue ?? 1_000_000,
          title,
          metricUnit ?? "",
          onChanged,
        );
      },
      child: AbsorbPointer(
        child: TextField(
          controller: TextEditingController(text: "$initialValue ${metricUnit ?? ""}"),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}

void _showNumberPicker(BuildContext context,
    int initialValue,
    int minValue, int maxValue, String title, String metricUnit, ValueChanged<int> onChanged) {
  var initValue = initialValue - minValue;
  ValueNotifier<int> selectedNumber = ValueNotifier<int>(initValue);
  FixedExtentScrollController scrollController = FixedExtentScrollController(initialItem: initValue);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SizedBox(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                child: ValueListenableBuilder<int>(
                  valueListenable: selectedNumber,
                  builder: (context, value, child) {
                    return ListWheelScrollView.useDelegate(
                      controller: scrollController,
                      itemExtent: 50,
                      physics: FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        selectedNumber.value = index;
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        builder: (context, index) {
                          var text = (minValue + index).toString().padLeft(2, '0');
                          return Text(
                            text,
                            style: TextStyle(
                              fontSize: index == value ? 24 : 18,
                              fontWeight: index == value
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: index == value
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          );
                        },
                        childCount: maxValue,
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  metricUnit,
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              var num = selectedNumber.value + minValue;
              onChanged(num);
              Navigator.pop(context);
            },
            child: Text("Select"),
          ),
        ],
      );
    },
  );
}

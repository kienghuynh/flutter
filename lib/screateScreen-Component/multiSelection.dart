import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';

class MultiSelection extends StatefulWidget {
  MultiSelection({Key? key}) : super(key: key);

  @override
  _MultiSelection createState() => _MultiSelection();
}

class _MultiSelection extends State<MultiSelection> {

  List<String> surfaceConditionList = [
    "Machined",
    "Grind",
    "Brushing",
    "Painting",
    "Others",
    "One side",
    "Both side",
    "One surface",
    "Both surface",
    "Others side"
  ];

  Rx<List<String>> selectedList = Rx<List<String>>([]);

  var selectedOption = ''.obs;

    @override
    Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(children: [
          DropDownMultiSelect(
              options: surfaceConditionList,
              whenEmpty: 'Select an option',              
              onChanged: (value) {
                selectedList.value = value;
                selectedOption.value = "";
                selectedList.value.forEach((element) {
                  selectedOption.value =
                      selectedOption.value + " " + element;
                });
              },
              selectedValues: selectedList.value,
          ),
        ]),
      ),
    );
  }
}

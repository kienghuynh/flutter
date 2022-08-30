import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';


class MultiSelectionImperfection extends StatefulWidget {
  MultiSelectionImperfection({Key? key}) : super(key: key);

  @override
  _MultiSelectionImperfection createState() => _MultiSelectionImperfection();
}

class _MultiSelectionImperfection extends State<MultiSelectionImperfection> {

  List<String> surfaceConditionList = [
    'BT',
    'OC',
    'ST',
    'MI',
    'C',
    'D',
    'LOF',
    'LOP',
    'P',
    'SI',
    'BP',
    'PL',
    'SP',
    'CL'
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

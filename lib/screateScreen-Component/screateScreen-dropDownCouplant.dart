import 'package:flutter/material.dart';
import 'package:get/get.dart';

class screateScreenDropDownCouplant extends StatefulWidget {
  screateScreenDropDownCouplant({Key? key}) : super(key: key);

  @override
  _screateScreenDropDownCouplant createState() =>
      _screateScreenDropDownCouplant();
}

class _screateScreenDropDownCouplant extends State<screateScreenDropDownCouplant> {
  final List<String> items = [
    'Water',
    'Oil',
    'Grease',
    'Cellulose paste',
    'Others'
  ];
  String? selectedValue;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<int> _getDividersIndexes() {
    List<int> _dividersIndexes = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _dividersIndexes.add(i);
      }
    }
    return _dividersIndexes;
  }

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blueGrey,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.all(5),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  hint: Text(
                                    'Select an option',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  items: _addDividersAfterItems(items),
                                  value: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value as String;
                                    });
                                  })));
  }
}

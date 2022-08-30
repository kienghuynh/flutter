import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:test/main.dart';
import 'package:test/screateScreen-Component/dropDown-Material.dart';
import 'package:test/screateScreen-Component/multiSelection-Imperfection.dart';
import 'package:test/screateScreen-Component/screateScreen-dropDownCouplant.dart';
import 'package:test/screateScreen-Component/multiSelection.dart';

void main() {
  runApp(const CreateScreen_App());
}

final List<String> items = [
  'Single V',
  'Double V',
  'Single V backing',
  'Single Be. Backing',
  'Other',
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

class CreateScreen_App extends StatelessWidget {
  const CreateScreen_App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(),
      home: const CreateScreen(title: ''),
    );
  }
}

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<CreateScreen> createState() => _CreateScreen();
}

class _CreateScreen extends State<CreateScreen> {

  
  String v1Value = 'V1-IIW';
  String v2Value = 'V2-IIW';
  String cpuValue = 'CPU-SONATEST';

  String flowValue = 'Flow detect method';
  String immersionValue = 'Immersion method';
  String gapValue = 'Gap method';
  String directValue = 'Direct contact method';

  bool v1IsChecked = false;
  bool v2IsChecked = false;
  bool cpuIsChecked = false;
  bool flowIsChecked = false;
  bool immersionIsChecked = false;
  bool gapIsChecked = false;
  bool directIsChecked = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              '2021/10/25 9:05',
              style: TextStyle(fontSize: 18),
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.account_circle, size: 30),
                  alignment: Alignment.centerLeft),
              Text(
                '''  Genie''',
                style: TextStyle(height: 2.7, fontSize: 16),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications, size: 30),
                padding: EdgeInsets.all(5.0),
              ),
            ],
            leading: (IconButton(
                onPressed: () {}, icon: Icon(Icons.menu, size: 30)))),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.house_sharp),
                              iconSize: 30,
                              color: Color.fromARGB(255, 2, 118, 207)),
                          TextButton(
                              onPressed: () {},
                              child: Text('Master',
                                  style: TextStyle(
                                      height: 1.4,
                                      fontSize: 18,
                                      decoration: TextDecoration.underline))),
                          Text(
                            '//',
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 16,
                              color: Color.fromARGB(255, 145, 146, 146),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()),
                                );
                              },
                              child: Text('Test method',
                                  style: TextStyle(
                                      height: 1.4,
                                      fontSize: 16,
                                      decoration: TextDecoration.underline))),
                        ],
                      )),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp()),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: Color.fromARGB(255, 114, 114, 114),
                          ),
                          label: Text(
                            'Back',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 114, 114, 114)),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 214, 213, 213)))
                    ],
                  )),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 40,
                        padding: EdgeInsets.fromLTRB(55, 0, 0, 0),
                        child: Text('// Create',
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 16,
                              color: Color.fromARGB(255, 145, 146, 146),
                            )))
                  ]),
              Row(children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Container(
                        padding: EdgeInsets.all(15),
                        color: Color.fromARGB(255, 235, 235, 235),
                        height: 60,
                        alignment: Alignment.center,
                        child: Text('Create new test method',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 90, 90, 90)))))
              ]),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        height: 40,
                      )
                    ],
                  ))
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(10.0),
                        child: Text('Test Method Code * :',
                            style: TextStyle(
                              fontSize: 16,
                            )),
                        //color: Colors.amber,
                        width: 180,
                        height: 50,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 207,
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          height: 50,
                          width: 185,
                          padding: EdgeInsets.all(10.0),
                          child: Text('Preparation :',
                              style: TextStyle(
                                fontSize: 16,
                              )))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blueGrey,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(5)),
                          width: 197,
                          height: 50,
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
                                  })))
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        height: 80,
                        width: 175,
                        padding: EdgeInsets.all(10.0),
                        child: Text('Surface Condition :',
                            style: TextStyle(
                              fontSize: 16,
                            )))
                  ]),
                  Column(
                    children: [
                      Container(
                        width: 217,
                        height: 80,
                        child: MultiSelection(),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          width: 185,
                          height: 50,
                          padding: EdgeInsets.all(10.0),
                          child: Text('Couplant :',
                              style: TextStyle(
                                fontSize: 16,
                              )))
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 198,
                        child: screateScreenDropDownCouplant(),
                      )
                    ],
                  )
                ],
              ),
              Row(children: [
                Column(children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      width: 185,
                      height: 50,
                      padding: EdgeInsets.all(10.0),
                      child: Text('Material :',
                          style: TextStyle(
                            fontSize: 16,
                          )))
                ]),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      height: 50,
                      width: 200,
                      child: DropDownMaterial(),
                    )
                  ],
                )
              ]),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(10.0),
                        child: Text('Reject Criteria :',
                            style: TextStyle(
                              fontSize: 16,
                            )),
                        //color: Colors.amber,
                        width: 180,
                        height: 50,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 209,
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(10,15,0,0),
                      child: Text('Calibration blocks :',
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      width: 180,
                      height: 470,
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 470,
                      width: 210,
                      alignment: Alignment.topLeft,
                      //padding: EdgeInsets.all((10)),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.zero,
                            height: 40,
                            width: 205,
                            child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text('V1-IIW'),
                            value: v1IsChecked,
                            onChanged: (Value) {
                              setState(() => 
                              v1IsChecked = !v1IsChecked  
                              );
                            },
                        
                          ),
                          ),
                          Container(
                            margin: EdgeInsets.zero,
                            height: 40,
                            width: 205,
                            child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text('V2-IIW'),
                            value: v2IsChecked,
                            onChanged: (Value) {
                              setState(() => 
                              v2IsChecked = !v2IsChecked  
                              );
                            },
                        
                          ),
                          ),
                          Container(
                            margin: EdgeInsets.zero,
                            height: 40,
                            width: 205,
                            child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text('CPU-SONATEST'),
                            value: cpuIsChecked,
                            onChanged: (Value) {
                              setState(() => 
                              cpuIsChecked = !cpuIsChecked  
                              );
                            },
                        
                          ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(15.0),
                            child: Text('Drill Hole',
                              style: TextStyle(
                                fontSize: 16,
                            )),
                            width: 180,
                            height: 50,
                      
                          ),
                          Container(
                            height: 50,
                            width: 170,
                            margin: EdgeInsets.fromLTRB(22,0,0,0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.zero,
                            height: 60,
                            width: 205,
                            child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text('Flow detect method'),
                            value: flowIsChecked,
                            onChanged: (Value) {
                              setState(() => 
                              flowIsChecked = !flowIsChecked  
                              );
                            },
                        
                          ),
                          ),
                          Container(
                            margin: EdgeInsets.zero,
                            height: 60,
                            width: 205,
                            child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text('Immersion method'),
                            value: immersionIsChecked,
                            onChanged: (Value) {
                              setState(() => 
                              immersionIsChecked = !immersionIsChecked  
                              );
                            },
                        
                          ),
                          ),
                          Container(
                            margin: EdgeInsets.zero,
                            height: 60,
                            width: 205,
                            child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text('Gap method'),
                            value: gapIsChecked,
                            onChanged: (Value) {
                              setState(() => 
                              gapIsChecked = !gapIsChecked  
                              );
                            },
                        
                          ),
                          ),
                          Container(
                            margin: EdgeInsets.zero,
                            height: 60,
                            width: 205,
                            child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text('Direct contact method'),
                            value: directIsChecked,
                            onChanged: (Value) {
                              setState(() => 
                              directIsChecked = !directIsChecked  
                              );
                            },
                        
                          ),
                          ),
                        ],
                      ),
                      
                      
                      
                      
                    )
                  ],
                )
              ]),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(10.0),
                        child: Text('Sensitivity Calibration :',
                            style: TextStyle(
                              fontSize: 16,
                            )),
                        //color: Colors.amber,
                        width: 180,
                        height: 60,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 209,
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        height: 80,
                        width: 175,
                        padding: EdgeInsets.all(10.0),
                        child: Text('Imperfection type :',
                            style: TextStyle(
                              fontSize: 16,
                            )))
                  ]),
                  Column(
                    children: [
                      Container(
                        width: 217,
                        height: 80,
                        child: MultiSelectionImperfection(),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 190,
                    //padding: EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp()),
                            );
                          },
                          icon: Icon(
                            Icons.save,
                            size: 20,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          label: Text(
                            'Save',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 40, 109, 247))),
                  ),
                  Container(
                    height: 50,
                    width: 180,
                    padding: EdgeInsets.fromLTRB(10,0,0,0),
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp()),
                            );
                          },
                          icon: Icon(
                            Icons.reply,
                            size: 20,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          label: Text(
                            'Discard',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 250, 31, 31))),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

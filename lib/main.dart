import 'package:flutter/material.dart';
import 'dart:async';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'createScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(),
      home: const ListviewScreen(title: ''),
    );
  }
}

class ListviewScreen extends StatefulWidget {
  const ListviewScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ListviewScreen> createState() => _ListviewScreen();
}

//dropdown button
final List<String> items = [
  'Column 1',
  'Column 2',
  'Column 3',
  'Column 4',
];
String? selectedValue;

class MethodList {
  factory MethodList.fromJson(Map<String, dynamic> json) {
    return MethodList(
        no: int.parse(json['no']),
        testMethodCode: json['testMethodCode'],
        createdDate: DateTime.parse(json['createdDate']),
        createdBy: json['createdBy']);
  }

  MethodList({
    required this.no,
    required this.testMethodCode,
    required this.createdDate,
    required this.createdBy,
  });

  final int no;
  final String testMethodCode;
  final DateTime createdDate;
  final String createdBy;
}

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
                fontSize: 14,
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

class _ListviewScreen extends State<ListviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('2021/10/25 9:05', style: TextStyle(fontSize: 18),),
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
          leading:
              (IconButton(onPressed: () {}, icon: Icon(Icons.menu, size: 30)))),
      body:
      SingleChildScrollView(child: Column(
        children: [
          Row(children: <Widget>[
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
                      ' // Test method',
                      style: TextStyle(
                        height: 1.4,
                        fontSize: 16,
                        color: Color.fromARGB(255, 145, 146, 146),
                      ),
                    ),
                  ],
                )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  child: Text('< Back',
                      style: TextStyle(
                          height: 1.4,
                          fontSize: 18,
                          color: Color.fromARGB(255, 114, 114, 114))),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 214, 213, 213)),
                )
              ],
            )),
          ]),
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                  padding: EdgeInsets.all(15),
                  color: Color.fromARGB(255, 214, 214, 214),
                  height: 60,
                  width: 200,
                  child: Text(
                    'Test method list',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.7,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                //width: 90,
                color: Color.fromARGB(255, 214, 214, 214),
                height: 60,
                padding: EdgeInsets.all(10),
                child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateScreen_App()),
                      );
                    },
                    icon: Icon(
                      Icons.add,
                      size: 20,
                    ),
                    label: Text(
                      'Create',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 86, 188, 68))),
              )),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  //width: 200,
                  height: 60,
                  color: Color.fromARGB(255, 214, 214, 214),
                  //padding: EdgeInsets.all(10),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text('Column'),
                      items: _addDividersAfterItems(items),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Container(
                    height: 60,
                    color: Colors.white,
                  )
                ],
              ))
            ],
          ),
          Container(
              child: FutureBuilder(
            future: getMethodListDataSource(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return snapshot.hasData
                  ? SfDataGrid(
                      source: snapshot.data,
                      columns: getColumns(),
                      isScrollbarAlwaysShown: true,
                      gridLinesVisibility: GridLinesVisibility.both,
                      headerGridLinesVisibility: GridLinesVisibility.both,
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    );
            },
          ))
        ],
      ),)
    );
  }

  Future<MethodListDataGridSource> getMethodListDataSource() async {
    var methodList = await generateMethodList();
    return MethodListDataGridSource(methodList);
  }

  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(

          columnName: 'No',
          columnWidthMode: ColumnWidthMode.auto,
          label: Container(
            color: Color.fromARGB(255, 214, 214, 214),
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.centerLeft,
            child: Text('No', overflow: TextOverflow.clip, softWrap: true),
          )),
      GridColumn(
          columnName: 'TestMethodCode',
          columnWidthMode: ColumnWidthMode.auto,
          label: Container(
            color: Color.fromARGB(255, 214, 214, 214),
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.centerLeft,
            child: Text('Test Method Code',
                overflow: TextOverflow.clip, softWrap: true),
          )),
      GridColumn(
          columnName: 'CreatedDate       ',
          columnWidthMode: ColumnWidthMode.fitByColumnName,
          label: Container(
            color: Color.fromARGB(255, 214, 214, 214),
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.centerLeft,
            child: Text('Created Date',
                overflow: TextOverflow.clip, softWrap: true),
          )),
      GridColumn(
          columnName: 'CreatedBy',
          columnWidthMode: ColumnWidthMode.auto,
          label: Container(
            color: Color.fromARGB(255, 214, 214, 214),
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.centerLeft,
            child:
                Text('Created By', overflow: TextOverflow.clip, softWrap: true),
          )),
      GridColumn(
          columnName: 'Action',
          columnWidthMode: ColumnWidthMode.auto,
          label: Container(
            color: Color.fromARGB(255, 214, 214, 214),
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.centerLeft,
            child: Text('Action', overflow: TextOverflow.clip, softWrap: true),
          )),
    ];
  }

  Future<List<MethodList>> generateMethodList() async {
    var respone =  await http.get(Uri.parse(
        'https://62fde4c4a85c52ee482b2729.mockapi.io/api/testmethodlist/MethodList'));
    var decodeMethod = json.decode(respone.body).cast<Map<String, dynamic>>();
    List<MethodList> methodList = await decodeMethod
        .map<MethodList>((json) => MethodList.fromJson(json))
        .toList();
    return methodList;
  }
}

class MethodListDataGridSource extends DataGridSource {
  MethodListDataGridSource(this.methodList) {
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  late List<MethodList> methodList;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        child: Text(
          row.getCells()[0].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(5.0),
      ),
      Container(
        child: Text(
          row.getCells()[1].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(5.0),
      ),
      Container(
        child: Text(
          DateFormat('dd/MM/yyyy hh:mm')
              .format(row.getCells()[2].value)
              .toString(),
          overflow: TextOverflow.ellipsis,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(5.0),
      ),
      Container(
        child: Text(
          row.getCells()[3].value.toString(),
          overflow: TextOverflow.ellipsis,
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(5.0),
      ),
      Container(
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.create_outlined,
                        color: Colors.blueAccent, size: 24),
                    padding: EdgeInsets.all(5.0))),
            Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_outline,
                        color: Colors.redAccent, size: 24),
                    padding: EdgeInsets.all(5.0)))
          ],
        )),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(5.0),
      ),
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRow() {
    dataGridRows = methodList.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell(columnName: 'No', value: dataGridRow.no),
        DataGridCell<String>(
            columnName: 'Test Method Code', value: dataGridRow.testMethodCode),
        DataGridCell<DateTime>(
            columnName: 'Created Date', value: dataGridRow.createdDate),
        DataGridCell<String>(
            columnName: 'Created By', value: dataGridRow.createdBy),
        DataGridCell(
            columnName: 'Action',
            value: Container(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.create_outlined,
                            color: Colors.blueAccent, size: 24),
                        padding: EdgeInsets.all(5.0))),
                Expanded(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete_outline,
                            color: Colors.blueAccent, size: 24),
                        padding: EdgeInsets.all(5.0)))
              ],
            )))
      ]);
    }).toList(growable: false);
  }
}

import 'package:flutter/material.dart';
import 'package:searchable_spinner_demo/searchable_spinner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //sample list
  List<String> list = ["1","2","3","4","5"];

  //sample variable
  String selectedFromList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            searchalbe_spinner.createSearchalbeDialog(context, "Select Item...", list).then((index) => {
              setState(() {
                selectedFromList = list[index];
              })
            });
          },
          child: Container(
            alignment: Alignment.center,
            width: 110,
            height: 100,
            color: Colors.blue,
            child: Text(selectedFromList == null ? "Select From List":selectedFromList.toString()),
          ),
        )
      ),
    );
  }
}

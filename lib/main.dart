import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Color(0xfff79631),
          )),
      body: Container(
        child: Stack(
          children: <Widget>[_itemOne(context), _itemTwo(context)],
        ),
      ),
    );
  }
}

Widget _itemOne(BuildContext context) => Container(
      child: Card(elevation: 10, color: const Color(0xffffffff)),
      height: 126.0,
      width: MediaQuery.of(context).size.width,
    );

Widget _itemTwo(BuildContext context) => Container(
      child: Card(elevation: 10, color: const Color(0xffffffff)),
      height: 122.0,
      width: MediaQuery.of(context).size.width,
    );

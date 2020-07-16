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
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: AppBar(
              backgroundColor: Color(0xfff79631),
            )),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = true;
        });
      },
      child: Container(
        child: Stack(
          children: <Widget>[
            _animatedCard(context, selected),
            _itemTwo(context)
          ],
        ),
      ),
    );
  }
}

Widget _animatedCard(BuildContext context, bool selected) => AnimatedContainer(
      height: selected ? 400.0 : 100.0,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
      child: _itemOne(context),
    );

Widget _itemOne(BuildContext context) => Container(
      child: Card(elevation: 10, color: const Color(0xffffffff)),
      height: 124.0,
      width: MediaQuery.of(context).size.width,
    );

Widget _itemTwo(BuildContext context) => Container(
      child: Card(
        elevation: 10,
        color: const Color(0xffffffff),
        child: Column(
          children: <Widget>[_topContent(), _bottomContent()],
        ),
      ),
      height: 122.0,
      width: MediaQuery.of(context).size.width,
    );

Widget _topContent() => Container(
      child: Row(
        children: <Widget>[
          Text("Property Taxes"),
          Text("5Mins"),
          Icon(
            Icons.cancel,
            size: 16,
            color: const Color(0xfff79631),
          ),
        ],
      ),
    );

Widget _bottomContent() => Container(
      child: Row(
        children: <Widget>[
          Text("Invoice 101 is overdue"),
        ],
      ),
    );

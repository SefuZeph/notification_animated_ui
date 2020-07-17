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
            Container(
              child: Card(
                elevation: 10,
                color: const Color(0xffffffff),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Property Taxes",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'VarelaRound',
                                ),
                              ),
                            ),
                            Padding(
                              child: Text("5Mins",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 12)),
                              padding: EdgeInsets.only(right: 16.0),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 16.0),
                              child: Visibility(
                                visible: selected,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selected = false;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    size: 16.0,
                                    color: const Color(0xfff79631),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _bottomContent()
                    ],
                  ),
                ),
              ),
              height: 122.0,
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}

Widget _animatedCard(BuildContext context, bool selected) => AnimatedContainer(
      height: selected ? 300.0 : 126.0,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
      child: _itemOne(context),
    );

Widget _itemOne(BuildContext context) => Container(
      child: Card(elevation: 10, color: const Color(0xffffffff)),
      height: 124.0,
      width: MediaQuery.of(context).size.width,
    );

Widget _bottomContent() => Container(
      child: Padding(
        padding: EdgeInsets.only(top: 2.0),
        child: Row(
          children: <Widget>[
            Text(
              "Invoice 101 is overdue",
              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16),
            ),
          ],
        ),
      ),
    );

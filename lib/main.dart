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
      onLongPress: () {
        setState(() {
          selected = false;
        });
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 16),),

            Text("Notifications",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'VarelaRound',
                )),
            Padding(padding: EdgeInsets.only(top: 6),),
            Stack(
              children: <Widget>[
                _animatedCard(context, selected),
                Container(
                  child: Card(
                    elevation: 10,
                    color: const Color(0xffffffff),
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 16.0),
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
      child: Card(
        elevation: 10,
        color: const Color(0xffffffff),
        child: Container(
          padding: EdgeInsets.only(top: 140.0, left: 24.0, right: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _bottomStackedContentOne(),
                _bottomStackedContentTwo()
              ],
            ),
          ),
        ),
      ),
      height: 124.0,
      width: MediaQuery.of(context).size.width,
    );

Widget _bottomContent() => Container(
      child: Padding(
        padding: EdgeInsets.only(top: 16.0),
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

Widget _bottomStackedContentOne() => Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/shipping-and-delivery.png'),
                width: 24.0,
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
              ),
              Text("Shiping",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12))
            ],
          ),
          Row(
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/sms.png'),
                width: 24.0,
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
              ),
              Text("SMS",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12))
            ],
          ),
        ],
      ),
    );

Widget _bottomStackedContentTwo() => Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/online-payment.png'),
                width: 24.0,
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
              ),
              Text("Payment",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12))
            ],
          ),
          Row(
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/call.png'),
                width: 24.0,
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16),
              ),
              Text("Call",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12))
            ],
          ),
        ],
      ),
    );

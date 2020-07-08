import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownValue = 'India';
  List<CircularStackEntry> data = <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(500.0, Color(0XFFE53935), rankKey: 'Q1'),
        new CircularSegmentEntry(1000.0, Color(0XFF76FF03), rankKey: 'Q2'),
        new CircularSegmentEntry(2000.0, Color(0XFFFFDE03), rankKey: 'Q3'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Color redTextColor = Color(0XFFE53935);
    Color greenTextColor = Color(0XFF76FF03);
    Color yellowTextColor = Color(0XFFFFDE03);
    Size screenSize = MediaQuery.of(context).size;
    const darkBlue = Color(0XFF1A36CF);


    FlutterStatusbarcolor.setStatusBarColor(Color(0xFF8fd0db));
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back.png'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  'COVID 19',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 80),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 20,
                    elevation: 16,
                    isExpanded: true,
                    style: TextStyle(color: darkBlue, fontSize: 20),
                    underline: Container(
                      width: screenSize.width,
                      height: 2,
                      color: darkBlue,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['India', 'Egypt', 'America', 'Nepal']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: screenSize.width * 0.05),
                  child: Container(
                    width: screenSize.width,
                    child: Card(
                        //color: Color(0xFF8fd0db),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 10,
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(left: 30),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/doctor.png'),
                                          height: 150,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(right: 35),
                                      child: AnimatedCircularChart(
                                        size: const Size(120.0, 120.0),
                                        initialChartData: data,
                                        chartType: CircularChartType.Pie,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Total Cases:',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                      Text(
                                        '3234',
                                        style: TextStyle(
                                            color: yellowTextColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Recovered:',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                      Text(
                                        '554',
                                        style: TextStyle(
                                            color: greenTextColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Deaths:',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                      Text(
                                        '823',
                                        style: TextStyle(
                                            color: redTextColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ))),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 20),
                      child: Text(
                        'PRECAUTIONS',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 115,
                          height: 115,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 10,
                            child: Image(
                              image: AssetImage('assets/images/namaste.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          width: 115,
                          height: 115,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 10,
                            child: Image(
                              image: AssetImage('assets/images/mask.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          width: 115,
                          height: 115,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 10,
                            child: Image(
                              image:
                                  AssetImage('assets/images/social_dist.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

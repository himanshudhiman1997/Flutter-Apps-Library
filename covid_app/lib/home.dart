import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:neumorphic/neumorphic.dart';

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
    Size screenSize = MediaQuery.of(context).size;
    const darkBlue = Color(0XFF1A36CF);
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: NeuCard(
                  bevel: 5,
                  color: darkBlue,
                  width: screenSize.width,
                  height: screenSize.height * 0.2,
                  curveType: CurveType.flat,
                  child: Image(
                    image: AssetImage(
                      'assets/images/corona_back.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'Global Status',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: darkBlue),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              //   child: NeuTextField(
              //     decoration: InputDecoration(
              //       labelText: 'Enter the country name',
              //       border: OutlineInputBorder(),
              //     ),
              //   ),
              // ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 20,
                    elevation: 16,
                    isExpanded: true,
                    style: TextStyle(color: darkBlue),
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
                    items: <String>['India', 'Pakistan', 'America', 'Nepal']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: screenSize.width * 0.1),
                  child: Container(
                      width: screenSize.width,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        elevation: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Image(
                              image: AssetImage('assets/images/doctor.png'),
                              height: 150,
                            )),
                            Padding(
                              padding: EdgeInsets.only(right: 35),
                              child: AnimatedCircularChart(
                              size: const Size(120.0, 120.0),
                              initialChartData: data,
                              chartType: CircularChartType.Pie,
                            ),),
                            
                          ],
                        ),
                      )))
              // Padding(
              //     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              //     child: Row(
              //       children: <Widget>[
              //         Padding(
              //           padding: EdgeInsets.only(right: 10),
              //           child: NeuCard(
              //             child: Center(
              //                 child: Text(
              //               '99999',
              //               style: TextStyle(
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold),
              //             )),
              //             curveType: CurveType.flat,
              //             bevel: 2,
              //             decoration: NeumorphicDecoration(
              //                 borderRadius: BorderRadius.circular(8),
              //                 color: Colors.yellow),
              //             height: 100,
              //             width: 100,
              //           ),
              //         ),
              //         Padding(
              //           padding: EdgeInsets.only(right: 10),
              //           child: NeuCard(
              //             child: Center(
              //                 child: Text(
              //               '99999',
              //               style: TextStyle(
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold),
              //             )),
              //             curveType: CurveType.flat,
              //             bevel: 2,
              //             decoration: NeumorphicDecoration(
              //                 borderRadius: BorderRadius.circular(8),
              //                 color: Colors.red),
              //             height: 100,
              //             width: 100,
              //           ),
              //         ),
              //         Padding(
              //           padding: EdgeInsets.only(right: 0),
              //           child: NeuCard(
              //             child: Center(
              //                 child: Text(
              //               '99999',
              //               style: TextStyle(
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold),
              //             )),
              //             curveType: CurveType.flat,
              //             bevel: 2,
              //             decoration: NeumorphicDecoration(
              //                 borderRadius: BorderRadius.circular(8),
              //                 color: Colors.green),
              //             height: 100,
              //             width: 100,
              //           ),
              //         )
              //       ],
              //     )),
            ],
          ),
        ),
      ),
    ));
  }
}

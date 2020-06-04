import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LocalAuthentication localAuthentication = LocalAuthentication();
  bool _isAuthenticating = false;
  bool _isAuthenticated = false;

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
      });
      authenticated = await localAuthentication.authenticateWithBiometrics(
          localizedReason: 'Success will change the background color',
          useErrorDialogs: true);
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    if (authenticated == true) {
      setState(() {
        _isAuthenticated = true;
      });
    }
  }

  void _cancelAuthentication() {
    localAuthentication.stopAuthentication();
    setState(() {
      _isAuthenticating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    const shrineBrown = Color(0xFF442C2E);
    const colorGradient = LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.cyanAccent, Colors.red]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
              decoration: BoxDecoration(gradient: colorGradient),
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 180, horizontal: 40),
                  child: Center(
                    child: Card(
                        color: _isAuthenticated
                            ? Colors.greenAccent
                            : Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 1,
                        child: Container(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                _isAuthenticated
                                    ? 'Authenticated successfully'
                                    : '',
                                style: TextStyle(
                                    color: shrineBrown,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Divider(
                                height: 1,
                                color: Colors.transparent,
                              ),
                              RaisedButton(
                                color: shrineBrown,
                                child: Text(
                                  _isAuthenticating ? 'Cancel' : 'Authenticate',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: _isAuthenticating
                                    ? _cancelAuthentication
                                    : _authenticate,
                              ),
                            ],
                          ),
                        ))),
                  ))),
        ));
  }
}

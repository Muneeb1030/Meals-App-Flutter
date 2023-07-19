import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:mealapp/Activities/Home.dart';
import 'package:mealapp/Activities/TabScreen.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool isConnected = false;

  @override
  void initState() {
    super.initState();
    checkConnection().then(
      (val) {
        if (val) {
          isConnected = val;
        }
      },
    );
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacementNamed(
          TabScreen.routeName,
          arguments: {'connect': isConnected},
        );
      },
    );
  }

  Future<bool> checkConnection() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity())
          .timeout(Duration(seconds: 5));
      if (connectivityResult == ConnectivityResult.none) {
        Fluttertoast.showToast(
            msg: "No Internet Connection",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);

        return false;
      }
      return true;
    } on TimeoutException catch (_) {
      Fluttertoast.showToast(
          msg: "Connection Timed Out",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "images/mlogo.png",
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              "Meal App",
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
      ),
    );
  }
}

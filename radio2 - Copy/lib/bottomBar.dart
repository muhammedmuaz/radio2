import 'package:flutter/material.dart';
import 'package:online_radio/Schedule.dart';
import 'package:online_radio/contact_91.dart';
import 'package:online_radio/home_screen.dart';
import 'package:online_radio/web.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key key, this.color}) : super(key: key);
  final Color color;
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  dynamic color;
  bool vat = true;
  change() {
    vat = !vat;
    if (vat == true) {
      setState(() {
        color = Colors.black12;
      });
    } else {
      setState(() {
        color = Colors.white;
      });
    }
  }

  int _curentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    Schedule(),
    Mail(),
    WebViewExample()
  ];
  ontappedbar(int index) {
    setState(() {
      _curentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_curentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellowAccent,
        onTap: ontappedbar,
        currentIndex: _curentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.mic_none_outlined,
                color: Colors.black,
              ),
              title: Text("Live Radio",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today, color: Colors.black),
              title: Text("Schedule",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail_outline_outlined, color: Colors.black),
              title: Text("Mail",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))),
          BottomNavigationBarItem(
              icon: Icon(Icons.web_outlined, color: Colors.black),
              title: Text(
                "Web",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}


import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading/indicator/line_scale_pulse_out_indicator.dart';
import 'package:loading/loading.dart';
import 'package:online_radio/contact_91.dart';
import 'package:online_radio/widgets/idle_dots.dart';
import 'player_bloc/player_bloc.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var color;
  yellow() {
    setState(() {
      color = Color(0xffbac229);
    });
  }

  white() {
    setState(() {
      color = Colors.white;
    });
  }

  black() {
    setState(() {
      color = Color(0xff322f38);
    });
  }

  final _planetRockUrl = 'http://172.93.237.106:8147/';

  final _planetRockImage = 'assets/logo.jpg';
  final _show1 = 'assets/dino.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          'FM 91 PAKISTAN',
          style: new TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: yellow,
              icon: Icon(
                Icons.circle_rounded,
                color: Colors.yellow,
                size: 30,
              )),
          IconButton(
              onPressed: black,
              icon: Icon(
                Icons.circle_rounded,
                color: Colors.black,
                size: 30,
              )),
          IconButton(
              onPressed: white,
              icon: Icon(
                Icons.circle_rounded,
                color: Colors.white,
                size: 30,
              ))
        ],
        backgroundColor: Color(0xffb5443a),
      ),
      backgroundColor: color,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Container(
          child: Center(
            child:
                BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
              if (state is PausedState) {
                return IdleDots(color: Theme.of(context).accentColor);
              } else if (state is PlayingState) {
                return Loading(
                  indicator: LineScalePulseOutIndicator(),
                  size: 100,
                  color: Theme.of(context).accentColor,
                );
              } else {
                throw Exception('Unknown state of bloc');
              }
            }),
          ),
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
            color: Colors.white10,
            border: Border.all(color: Colors.black, width: 0.4)),
        height: 80,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                width: 50,
                child: Image.asset(_show1),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Capital Dino ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "5pm - 10am",
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                )
              ],
            ),
            //Text("10 am - 1pm",style: TextStyle(color: Colors.blue),),
            Padding(
              padding: const EdgeInsets.only(left:140,),
              child: BlocBuilder<PlayerBloc, PlayerState>(
                builder: (BuildContext context, state) {
                  if (state is PausedState) {
                    return IconButton(
                      icon: Icon(
                        Icons.play_arrow,
                        size: 32,
                        color: Color(0xff1d307d),
                      ),
                      onPressed: () {
                        context
                        .bloc<PlayerBloc>()
                            .add(PlayEvent(url: _planetRockUrl));
                      },
                    );
                  } else {
                    return IconButton(
                      icon: Icon(
                        Icons.pause,
                        size: 32,
                        color: Color(0xff1d307d),
                      ),
                      onPressed: () {
                        context.bloc<PlayerBloc>()
                        .add(PauseEvent());
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

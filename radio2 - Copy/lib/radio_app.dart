import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_radio/bottomBar.dart';
import 'package:online_radio/home_screen.dart';
import 'package:online_radio/player_bloc/player_bloc.dart';
import 'package:online_radio/radio/just_audio_player.dart';
import 'package:online_radio/radio/radio_player.dart';


class RadioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RadioPlayer radioPlayer = JustAudioPlayer();
    return MaterialApp(
      title: 'FM91 Pakistan',
      debugShowCheckedModeBanner: false,
    //  theme: ThemeData.light(),
      home: BlocProvider<PlayerBloc>(
        create: (context) => PlayerBloc(radioPlayer: radioPlayer),
        child: BottomNavigation(),
      ),
    );
  }
}

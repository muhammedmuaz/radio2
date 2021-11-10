import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
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
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'http://www.fm91.com.pk/schedulewv/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          // onProgress: (int progress) {
          //   return CircularProgressIndicator();
          // },
           javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
        );
      }),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  // Widget favoriteButton() {
  //   return FutureBuilder<WebViewController>(
  //       future: _controller.future,
  //       builder: (BuildContext context,
  //           AsyncSnapshot<WebViewController> controller) {
  //         if (controller.hasData) {
  //           return FloatingActionButton(
  //             onPressed: () async {
  //               final String url = (await controller.data.currentUrl());
  //               // ignore: deprecated_member_use
  //               Scaffold.of(context).showSnackBar(
  //                 SnackBar(content: Text('Favorited $url')),
  //               );
  //             },
  //           );
  //         }
//           return Container();
//         });
//   }
// }
}

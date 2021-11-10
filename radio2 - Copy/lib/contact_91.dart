import 'package:flutter/material.dart';
import 'package:online_radio/bottomBar.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class Mail extends StatefulWidget {
  @override
  _MailState createState() => _MailState();
}

class _MailState extends State<Mail> {
  final _mailcontroller = TextEditingController();

  final _feedbackController = TextEditingController();
  Future<void> send() async {
    final Email email = Email(
      body: _feedbackController.text,
      subject: _mailcontroller.text,
      recipients: ["maazifran03360183798@gmail.com"],
      isHTML: true,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
      print(platformResponse);
    } catch (error) {
      platformResponse = error.toString();
      print(platformResponse);
    }
  }

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
        appBar:AppBar(
        toolbarHeight: 80,
            title: Text(
                        'FM 91 PAKISTAN',
                        style: new TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Text("CONTACT US",
                style: TextStyle(color: Colors.black, fontSize: 25)),
            SizedBox(
              height: 150,
            ),
            Text("Email",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20)),
            Padding(
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 20),
              child: TextFormField(
                controller: _mailcontroller,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 3))),
              ),
            ),
            Text("Feedback",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20)),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 20),
              child: TextFormField(
                controller: _feedbackController,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 20, color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 3))),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            ElevatedButton(
              onPressed: send,
              child: Text(
                "Send",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  padding:
                      EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ]),
        ));
  }
}

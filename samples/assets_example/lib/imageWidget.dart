import 'package:flutter/material.dart';

class ImageWidgetApp extends StatefulWidget {
  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidgetApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          Expanded(
            child: Image.asset('images/ku-character.png'),
          ),
          Text(
            'Konkuk University',
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 24,
            ),
          ),
          Expanded(
            child: Image.asset('images/ku-logo.png'),
          ),
        ], mainAxisAlignment: MainAxisAlignment.center),
      ),
    );
  }
}

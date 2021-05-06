import 'package:flutter/material.dart';

class CalculationPage extends StatefulWidget {
  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<CalculationPage> {
  String result = '';
  TextEditingController integer1 = TextEditingController();
  TextEditingController integer2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculation'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  controller: integer1,
                  decoration: InputDecoration(
                    labelText: '첫번째 정수',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  controller: integer2,
                  decoration: InputDecoration(
                    labelText: '두번째 정수',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton.icon(
                      onPressed: addition,
                      icon: Icon(Icons.add_circle_outline),
                      label: Text('덧셈'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton.icon(
                      onPressed: substract,
                      icon: Icon(Icons.remove_circle_outline),
                      label: Text('뺄셈'),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton.icon(
                      onPressed: multifly,
                      icon: Icon(Icons.cancel_outlined),
                      label: Text('곱셈'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton.icon(
                      onPressed: divide,
                      icon: Icon(Icons.block),
                      label: Text('나눗셈'),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('$result'),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
      ),
    );
  }

  addition() {
    int _result =
        int.parse(integer1.value.text) + int.parse(integer2.value.text);

    setState(() {
      result = _result.toString();
    });
  }

  substract() {
    int _result =
        int.parse(integer1.value.text) - int.parse(integer2.value.text);

    setState(() {
      result = _result.toString();
    });
  }

  multifly() {
    int _result =
        int.parse(integer1.value.text) * int.parse(integer2.value.text);

    setState(() {
      result = _result.toString();
    });
  }

  divide() {
    int _result =
        (int.parse(integer1.value.text) / int.parse(integer2.value.text))
            .round();

    setState(() {
      result = _result.toString();
    });
  }
}

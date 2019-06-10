import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    title: 'routing app',
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _textcontroller = new TextEditingController();

  Future _textbox(BuildContext context) async {
    Map results = await Navigator.of(context).push(new MaterialPageRoute<Map>(
        builder: (BuildContext context) => NextScreen(
              name: _textcontroller.text,
            )));

    if (results != null && results.containsKey("info")) {
      print(results['info'].toString());
      _textcontroller.text = results['info'].toString();
    }else{
      print('nothing received');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('home'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              controller: _textcontroller,
              decoration: InputDecoration(
                hintText: "enter your text",
              ),
            ),
          ),
          new ListTile(
            title: new FlatButton(
                onPressed: () {
                  _textbox(context);
                },
                child: new Text("next screen")),
          )
        ],
      ),
    );
  }
}

class NextScreen extends StatefulWidget {
  final String name;

  NextScreen({Key key, this.name}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  var _nextscreencontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('second Screen'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            title: new Text(
              '${widget.name}',
              style: new TextStyle(fontSize: 15.3, fontWeight: FontWeight.bold),
            ),
          ),
          new ListTile(
            title: new TextField(
              controller: _nextscreencontroller,
              decoration: InputDecoration(hintText: 'enter text'),
            ),
          ),
          new ListTile(
            title: new FlatButton(
                onPressed: () {
                  Navigator.pop(context, {'info': _nextscreencontroller.text});
                },
                child: new Text('send back')),
          )
        ],
      ),
    );
  }
}

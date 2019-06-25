import 'package:flutter_web/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plan Trip',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Where to'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  DateTime _dateTime = new DateTime.now();


//  Future<Null> _selectedDate(BuildContext context) async {
//    final DateTime picked = await showDatePicker(
//        context: context,
//        initialDate: _dateTime,
//        firstDate: new DateTime(2015),
//        lastDate: new DateTime(2021));
//
//    if (picked != null && picked != _dateTime) {
//      setState(() {
//        _dateTime = picked;
//      });
//    }
//  }
  String _value = '';

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2019),
        lastDate: new DateTime.now().add(new Duration(days: 500)));
    print('I am here now');
    if (picked != null) setState(() => _value = picked.toString());
  }

  final myController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    myController.addListener(() {
      print("Hitting add Listener");
      _selectDate();
    });
  }

  @override
  void dispose() {
    super.dispose();
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: new SafeArea(
            top: false,
            bottom: false,
            child: new Form(
                key: _formKey,
                autovalidate: true,
                child: new ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: <Widget>[
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.place),
                        hintText: 'Where to',
                        labelText: 'Option 1',
                      ),
                      autofocus: true,
                    ),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.place),
                        hintText: 'Where to',
                        labelText: 'Option 2',
                      ),
                      autofocus: true,
                    ),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.place),
                        hintText: 'Where to',
                        labelText: 'Option 3',
                      ),
                      autofocus: true,
                    ),
                    new Text(
                      'From +${_dateTime.toString()}',
                    ),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.calendar_today),
                        hintText: 'mm/dd/yyy',
                        labelText: 'From',
                      ),
                      controller: myController,
                    ),
                    new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.calendar_today),
                        hintText: 'mm/dd/yyyy',
                        labelText: 'End',
                      ),
                    ),
                    new RaisedButton(
                      onPressed: _selectDate,
                      child: new Text('Click me'),
                    ),
                    new IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: _selectDate,
                    ),
                  ],
                ))));
  }
}

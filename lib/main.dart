import 'package:flutter/material.dart';
import 'package:flutter_app/counter.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ChangeNotifierProvider(
        builder: (context) => Counter(),
        child: FirstPage(),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Student Portal")),
      body: Center(
        child: Row(
          children: <Widget>[
            SizedBox(width: 55.0,),
            Text("Page one value = ${counter.count}"),
            SizedBox(width: 55.0,),
            RaisedButton(
                child: Text("Next"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChangeNotifierProvider.value(
                        value: counter,
                        child: SecondPage(),
                      )));
                })
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "addP1",
            child: Icon(Icons.add),
            onPressed: () {
              counter.increment();
            },
            backgroundColor: Colors.green,
          ),
          SizedBox(width: 20.0),
          FloatingActionButton(
            heroTag: "removeP1",
            child: Icon(Icons.remove),
            onPressed: () {
              counter.decrement();
            },
            backgroundColor: Colors.red,
          )
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Student Portal")),
      body: Center(
        child: Row(
          children: <Widget>[
            SizedBox(width: 55.0,),
            Text("Page two value = ${counter.count}"),
            SizedBox(width: 55.0,),
            RaisedButton(
                child: Text("Previous"),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "addP2",
            child: Icon(Icons.add),
            onPressed: () {
              counter.increment();
            },
            backgroundColor: Colors.green,
          ),
          SizedBox(width: 20.0),
          FloatingActionButton(
            heroTag: "removeP2",
            child: Icon(Icons.remove),
            onPressed: () {
              counter.decrement();
            },
            backgroundColor: Colors.red,
          )
        ],
      ),
    );
  }
}

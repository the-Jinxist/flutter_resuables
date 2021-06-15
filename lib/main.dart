import 'package:flutter/material.dart';
import 'package:flutterresuables/util/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
//        primarySwatch: Colors.white,
          primaryColor: Colors.white,
          iconTheme: const IconThemeData(
              color: Colors.black,
              size: 24
          ),
          backgroundColor: Colors.white,
          accentColor: Colors.orange,
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontFamily: "Lato_Bold",
              fontSize: 35,
              color: Colors.black,
            ),
            headline2: TextStyle(
              fontFamily: "Poppins",
              fontSize: 17,
              color: Colors.black,
            ),

            bodyText1: TextStyle(
              fontFamily: "Poppins",
              fontSize: 15,
              color: Colors.black,
            ),
            bodyText2: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              color: Colors.black,
            ),
          ),
      ),
      home: Builder(builder: (BuildContext context){
        final Size size = MediaQuery.of(context).size;
        SizeConfig.init(context, width: size.width, height: size.height, allowFontScaling: true);

        return MyHomePage(title: 'Flutter Demo Home Page');
      }),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

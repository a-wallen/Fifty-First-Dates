import 'package:fiftyfirstdates/utility/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'initData.dart';
import 'date.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: fiftyFirstDatesTheme(),
      home: MyHomePage(title: 'First Dates'),
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
  Future<List<Date>> _dates;

  Date activeDate;
  Date _getRandomDate() {
    var rng = new Random();
    if (_dates != null) {
      _dates.then((list) => setState(() {
            activeDate = list[rng.nextInt(list.length)];
          }));
    }
  }

  @override
  void initState() {
    _dates = initDateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.pacifico(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: _dates,
          builder: (BuildContext context, AsyncSnapshot<List<Date>> snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: activeDate == null
                    ? Text(
                        "Hit the refresh button to get a date idea.",
                        style: GoogleFonts.playfairDisplay(
                            fontSize: 16,
                            textStyle: Theme.of(context).textTheme.headline1),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            activeDate.getTitle,
                            style: GoogleFonts.playfairDisplay(
                                textStyle:
                                    Theme.of(context).textTheme.headline1),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1.0,
                          ),
                          Text(
                            activeDate.getDescription,
                            style: GoogleFonts.nunito(
                                textStyle:
                                    Theme.of(context).textTheme.subtitle1),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: secondaryColor,
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getRandomDate,
        tooltip: 'Get a random date',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

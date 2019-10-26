import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_plus/components/KeepAliveFutureBuilder.dart';
import 'package:green_plus/components/TransactionItem.dart';

import 'package:green_plus/components/FootprintIndicator.dart';

void main() => runApp(MyApp());

Map<int, Color> color = {
  50: Color.fromRGBO(132, 174, 83, .1),
  100: Color.fromRGBO(132, 174, 83, .2),
  200: Color.fromRGBO(132, 174, 83, .3),
  300: Color.fromRGBO(132, 174, 83, .4),
  400: Color.fromRGBO(132, 174, 83, .5),
  500: Color.fromRGBO(132, 174, 83, .6),
  600: Color.fromRGBO(132, 174, 83, .7),
  700: Color.fromRGBO(132, 174, 83, .8),
  800: Color.fromRGBO(132, 174, 83, .9),
  900: Color.fromRGBO(132, 174, 83, 1),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green +',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Green +'),
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
  int imageNr = 5;
  int flow = 0;

  void _incrementCounter() {
    setState(() {
      flow = 1;
      if (imageNr < 5) {
        imageNr++;
      }
    });
  }

  void _decreaseCounter() {
    setState(() {
      flow = 0;
      if (imageNr > 1) {
        imageNr--;
      }
    });
  }

  _fetchPage(int pageNumber, int pageSize) async {
    await Future.delayed(Duration(seconds: 1));

    return List.generate(pageSize, (index) {
      return {
        'name': 'Transaction ${index.toString()}',
        'consumption': Random().nextInt(100),
      };
    });
  }

  ListView _transactionItems(List items) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: items.map((transactionInfo) {
        return new TransactionItem(transactionInfo: transactionInfo);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: FootprintIndicator(imageNr: imageNr, flow: flow),
            ),
            Text(
              'Your Ecological Footprint',
              style: Theme.of(context).textTheme.title,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Icon(
                      FontAwesomeIcons.minus,
                      color: Colors.red,
                    ),
                    onPressed: imageNr == 1 ? null : _decreaseCounter,
                  ),
                  FlatButton(
                    child: Icon(
                      FontAwesomeIcons.plus,
                      color: Colors.green,
                    ),
                    onPressed: imageNr == 5 ? null : _incrementCounter,
                  ),
                ],
              ),
            ),
            Expanded(
              child: _buildListView(),
            )
          ],
        ),
      ),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemBuilder: (context, pageNumber) {
        return KeepAliveFutureBuilder(
          future: this._fetchPage(pageNumber, 20),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return this._transactionItems(snapshot.data);
                }
            }
          },
        );
      },
    );
  }
}

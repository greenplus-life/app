import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_plus/components/FootprintIndicator.dart';
import 'package:green_plus/components/KeepAliveFutureBuilder.dart';
import 'package:green_plus/components/TransactionItem.dart';

class HomeGreenPlus extends StatefulWidget {
  HomeGreenPlus({Key key, this.userData}) : super(key: key);

  final userData;

  @override
  _HomeGreenPlusState createState() => _HomeGreenPlusState();
}

class _HomeGreenPlusState extends State<HomeGreenPlus> {
  int footprintStatus = 6;
  int flow = 2;
  String avatarURL;
  String username;
  int footprint;

  @override
  void initState() {
    // TODO call data
    super.initState();
    updateUI(widget.userData);
  }

  void updateUI(dynamic userData) {
    setState(() {
      if (userData == null) {
        username = "";
        avatarURL = 'Error';
        footprint = 0;
        return;
      }
      username = userData['username'];
      avatarURL = userData['avatarUrl'];
      footprint = userData['footprint'];
    });
  }

  void _incrementCounter() {
    setState(() {
      flow = 1;
      if (footprintStatus < 6) {
        footprintStatus++;
      }
    });
  }

  void _decreaseCounter() {
    setState(() {
      flow = 0;
      if (footprintStatus > 1) {
        footprintStatus--;
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
        title: Text("Green +"),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: avatarURL != null
              ? CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(avatarURL),
                )
              : null,
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                '$username',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: FootprintIndicator(
                flow: flow,
                footprintStatus: footprintStatus,
              ),
            ),
            Text(
              'Your Ecological Footprint',
              style: Theme.of(context).textTheme.display1,
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
                    onPressed: footprintStatus == 1 ? null : _decreaseCounter,
                  ),
                  FlatButton(
                    child: Icon(
                      FontAwesomeIcons.plus,
                      color: Colors.green,
                    ),
                    onPressed: footprintStatus == 6 ? null : _incrementCounter,
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

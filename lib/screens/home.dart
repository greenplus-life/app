import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:green_plus/components/FootprintIndicator.dart';
import 'package:green_plus/components/KeepAliveFutureBuilder.dart';
import 'package:green_plus/components/TransactionItem.dart';
import 'package:green_plus/services/greenplus.dart';

class HomeGreenPlus extends StatefulWidget {
  HomeGreenPlus({Key key, this.userData, this.recordData}) : super(key: key);

  final userData;
  final recordData;

  @override
  _HomeGreenPlusState createState() => _HomeGreenPlusState();
}

class _HomeGreenPlusState extends State<HomeGreenPlus> {
  int flow = 2;
  String avatarURL;
  String username;
  int footprint;
  List<GreenRecordModel> recordData = [];

  @override
  void initState() {
    super.initState();
    updateUI(widget.userData, widget.recordData);
  }

  getUserData() async {
    var profileData = await GreenplusModel().getUserData();
    var recordData = await GreenplusModel().getRecordData();

    updateUI(profileData, recordData);
  }

  void updateUI(dynamic userData, dynamic greenRecordData) {
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
      flow = userData['footflow'] != null ? userData['footflow'] : 1;
      if (greenRecordData == null) {
        recordData = [];
        return;
      }
      recordData = [];
      for (var item in greenRecordData) {
        var record = item['greenRecord'];
        var dur = item['durations'];
        var score = item['score'];
        Map<String, double> durations = Map();
        if (dur != null) {
          dur.forEach((k, v) => durations[k] = v);
        }
        print(record['originDate']);
        print(record['targetDate']);
        recordData.add(GreenRecordModel(
          score: score,
          notice: record['notice'],
          meansOfTransportation: record['meansOfTransportation'],
          energyConsumption: record['energyConsumption'],
          fuelConsumption: record['fuelConsumption'],
          originDate: record['originDate'] != null
              ? DateTime.parse(record['originDate'])
              : DateTime.parse("1970-01-01T00:00:00Z"),
          targetDate: record['targetDate'] != null
              ? DateTime.parse(record['targetDate'])
              : DateTime.parse("1970-01-01T00:00:00Z"),
          originLat: record['origin']['latitude'],
          originLon: record['origin']['longitude'],
          targetLat: record['target']['latitude'],
          targetLon: record['target']['longitude'],
          durations: durations,
          appDescription: item['appDescription'],
        ));
      }
      print(recordData);
    });
  }

  // _fetchPage(int pageNumber, int pageSize) async {
  //   await Future.delayed(Duration(seconds: 1));

  //   return List.generate(pageSize, (index) {
  //     return {
  //       'name': 'Transaction ${index.toString()}',
  //       'consumption': Random().nextInt(100),
  //     };
  //   });
  // }

  ListView _transactionItemsReal() {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: recordData.map((recordModel) {
        return new TransactionItem(greenRecordModel: recordModel);
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
              child: GestureDetector(
                onTap: () {
                  getUserData();
                },
                child: FootprintIndicator(
                  flow: flow,
                  footprintStatus: footprint,
                ),
              ),
            ),
            Text(
              'Your Ecological Footprint',
              style: Theme.of(context).textTheme.display1,
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
    // return ListView.builder(
    //   itemBuilder: (context, pageNumber) {
    //     return KeepAliveFutureBuilder(
    //       future: this._fetchPage(pageNumber, 20),
    //       builder: (context, snapshot) {
    //         switch (snapshot.connectionState) {
    //           case ConnectionState.none:
    //           case ConnectionState.waiting:
    //             return SizedBox(
    //               height: MediaQuery.of(context).size.height * 2,
    //               child: Align(
    //                 alignment: Alignment.center,
    //                 child: CircularProgressIndicator(),
    //               ),
    //             );
    //           case ConnectionState.active:
    //           case ConnectionState.done:
    //             if (snapshot.hasError) {
    //               return Text('Error: ${snapshot.error}');
    //             } else {
    return this._transactionItemsReal();
    //             }
    //         }
    //       },
    //     );
    //   },
    // );
  }
}

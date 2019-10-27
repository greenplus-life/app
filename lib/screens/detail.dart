import 'dart:math';

import 'package:flutter/material.dart';
import 'package:green_plus/services/greenplus.dart';

class RecordDetailView extends StatefulWidget {
  RecordDetailView({Key key, this.userData, this.recordData}) : super(key: key);

  final userData;
  final GreenRecordModel recordData;

  @override
  _RecordDetailViewState createState() => _RecordDetailViewState();
}

class _RecordDetailViewState extends State<RecordDetailView> {
  GreenRecordModel recordData;

  List<Widget> durationsList = [];

  @override
  void initState() {
    super.initState();
    recordData = widget.recordData;
    getListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Green +"),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                'Alternative Routes',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: Container(
                width: 400,
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(1.8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Image(
                  image: AssetImage("assets/map.png"),
                ),
              ),
            ),
            Text(
              '${recordData.appDescription}',
              style: Theme.of(context).textTheme.body2,
            ),
            Column(
              children: durationsList,
            ),
          ],
        ),
      ),
    );
  }

  getListData() {
    print(recordData);
    var difference =
        recordData.targetDate.difference(recordData.originDate).inSeconds;
    print(difference);
    var bestTransportation = recordData.meansOfTransportation;
    var bestTransportationTime = difference;
    for (String key in recordData.durations.keys) {
      if (recordData.durations[key].truncate() < bestTransportationTime) {
        bestTransportation = key;
        bestTransportationTime = recordData.durations[key].truncate();
      }
    }
    setState(() {
      durationsList.add(ListTile(
        leading: Icon(getTransportationIcon(recordData.meansOfTransportation),
            color: bestTransportation == recordData.meansOfTransportation
                ? Colors.green
                : Colors.red),
        title: Text('${difference.toString()} Minutes'),
        subtitle: Text(recordData.notice != null ? recordData.notice : ""),
      ));
      durationsList.add(Divider(
        color: Colors.grey,
      ));
      recordData.durations.forEach(
        (k, v) => {
          durationsList.add(ListTile(
            leading: Icon(getTransportationIcon(k)),
            title: Text('${v.toStringAsFixed(0)} Minutes'),
          ))
        },
      );
    });
  }

  IconData getTransportationIcon(String transport) {
    if (transport == "FLIGHT") return Icons.flight;
    if (transport == "CAR") return Icons.directions_car;
    if (transport == "ECAR") return Icons.flash_on;
    if (transport == "LOCAL_TRANSPORTATION") return Icons.directions_bus;
    if (transport == "TRAIN") return Icons.directions_railway;
    if (transport == "WALKING")
      return Icons.directions_walk;
    else
      return Icons.ac_unit;
  }
}

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

  @override
  void initState() {
    super.initState();
    recordData = widget.recordData;
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
      body: Column(
        children: <Widget>[
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
              child: Text(
                '${recordData.appDescription}',
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text("Test"),
                Text("Test"),
                Text("Test"),
                // getListData(),
                // recordData.durations.values.map((v) {
                //   return new ListTile(
                //     leading: Icon(Icons.directions_car),
                //     title: Text(v.toString()),
                //     subtitle: Text(
                //         recordData.notice != null ? recordData.notice : ""),
                //   );
                // }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getListData() {
    List<ListTile> list = [];
    recordData.durations.forEach((k, v) => {
          // Icon transportationIcon;
          // if (k == "FLIGHT") {
          //   transportationIcon = Icon(Icons.flight);
          // }
          // if (k == "CAR") {
          //   transportationIcon = Icon(Icons.directions_car);
          // }
          // if (k == "ECAR") {
          //   transportationIcon = Icon(Icons.flash_on);
          // }
          // if (k == "LOCAL_TRANSPORTATION") {
          //   transportationIcon = Icon(Icons.directions_bus);
          // }
          // if (k == "TRAIN") {
          //   transportationIcon = Icon(Icons.directions_railway);
          // }
          // if (k == "WALKING") {
          //   transportationIcon = Icon(Icons.directions_walk);
          // }
          list.add(ListTile(
            leading: Icon(Icons.directions_car),
            title: Text(v.toString()),
            subtitle: Text(recordData.notice != null ? recordData.notice : ""),
          ))
        });
    return list;
  }
}

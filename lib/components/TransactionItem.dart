import 'package:flutter/material.dart';
import 'package:green_plus/screens/detail.dart';
import 'package:green_plus/services/greenplus.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.greenRecordModel,
  }) : super(key: key);

  final GreenRecordModel greenRecordModel;

  @override
  Widget build(BuildContext context) {
    Icon leadingIcon;
    Icon trailingIcon;
    Icon transportationIcon;
    if (greenRecordModel.score == "GREEN") {
      leadingIcon = Icon(Icons.thumb_up, color: Colors.green);
      trailingIcon = Icon(Icons.check);
    }
    if (greenRecordModel.score == "ORANGE") {
      leadingIcon = Icon(Icons.thumbs_up_down, color: Colors.orange);
      trailingIcon = Icon(Icons.repeat);
    }
    if (greenRecordModel.score == "RED") {
      leadingIcon = Icon(Icons.thumb_down, color: Colors.red);
      trailingIcon = Icon(Icons.repeat);
    }
    if (greenRecordModel.meansOfTransportation != null) {
      if (greenRecordModel.meansOfTransportation == "FLIGHT") {
        //FLIGHT(true), CAR(true), ECAR(false), LOCAL_TRANSPORTATION(false), TRAIN(false), WALKING(false);
        transportationIcon = Icon(Icons.flight);
      }
      if (greenRecordModel.meansOfTransportation == "CAR") {
        //FLIGHT(true), CAR(true), ECAR(false), LOCAL_TRANSPORTATION(false), TRAIN(false), WALKING(false);
        transportationIcon = Icon(Icons.directions_car);
      }
      if (greenRecordModel.meansOfTransportation == "ECAR") {
        //FLIGHT(true), CAR(true), ECAR(false), LOCAL_TRANSPORTATION(false), TRAIN(false), WALKING(false);
        transportationIcon = Icon(Icons.flash_on);
      }
      if (greenRecordModel.meansOfTransportation == "LOCAL_TRANSPORTATION") {
        //FLIGHT(true), CAR(true), ECAR(false), LOCAL_TRANSPORTATION(false), TRAIN(false), WALKING(false);
        transportationIcon = Icon(Icons.directions_bus);
      }
      if (greenRecordModel.meansOfTransportation == "TRAIN") {
        //FLIGHT(true), CAR(true), ECAR(false), LOCAL_TRANSPORTATION(false), TRAIN(false), WALKING(false);
        transportationIcon = Icon(Icons.directions_railway);
      }
      if (greenRecordModel.meansOfTransportation == "WALKING") {
        //FLIGHT(true), CAR(true), ECAR(false), LOCAL_TRANSPORTATION(false), TRAIN(false), WALKING(false);
        transportationIcon = Icon(Icons.directions_walk);
      }
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RecordDetailView(
            recordData: greenRecordModel,
          );
        }));
      },
      child: ListTile(
        leading: Column(
          children: <Widget>[
            transportationIcon != null ? transportationIcon : null,
            leadingIcon,
          ],
        ),
        title: Text(greenRecordModel.appDescription != null
            ? greenRecordModel.appDescription
            : ""),
        subtitle: Text(
            greenRecordModel.notice != null ? greenRecordModel.notice : ""),
      ),
    );
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

const greenplusUrl =
    'https://stuttgart-hackathon-2019.herokuapp.com/greenusers/1';

class GreenplusModel {
  GreenplusModel({this.username, this.avatarUrl, this.footprint});
  String username;
  String avatarUrl;
  int footprint;

  Future<dynamic> getUserData() async {
    http.Response response = await http.get(greenplusUrl);
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getRecordData() async {
    http.Response response = await http.get('$greenplusUrl/greenrecords');
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}

class GreenRecordModel {
  GreenRecordModel({
    this.meansOfTransportation,
    this.originLon,
    this.originLat,
    this.targetLon,
    this.targetLat,
    this.score,
    this.durations,
    this.fuelConsumption,
    this.energyConsumption,
    this.notice,
    this.appDescription,
  });

  String meansOfTransportation;
  double originLon;
  double originLat;
  double targetLon;
  double targetLat;
  String score;
  Map<String, double> durations;
  int fuelConsumption;
  int energyConsumption;
  String notice;
  String appDescription;
}

// {
//     "id": 1,
//     "username": "Greta Tom Winter",
//     "avatarUrl": "https://cdn0.iconfinder.com/data/icons/avatars-19/64/_hipster_girl-512.png",
//     "createdDate": "2019-10-26T00:00:00.000+0000",
//     "footprint": 2000,
//     "vehicleSerialNumber": "2C24D42D66674A5A64",
//     "dbUserToken": {
//         "id": 1,
//         "refreshToken": "eyJhbGciOiJub25lIn0.eyJleHAiOjE1Nzk4NjIxNzEsImp0aSI6IjcxNzYxZTYxLTNhZTMtNDMzZC1hMThiLTM5OGU1ZWZkYmQwNCJ9.",
//         "userAccounts": []
//     },
//     "greenRecords": []
// }

// Green Records

// [
//     {
//         "greenRecord": {
//             "id": 1,
//             "meansOfTransportation": "WALKING",
//             "createdDate": "2019-10-26T15:09:27.266+0000",
//             "greenUser": {},
//             "origin": {
//                 "id": 2,
//                 "longitude": 71.47036,
//                 "latitude": 51.160522
//             },
//             "target": {
//                 "id": 3,
//                 "longitude": 73.92123517593443,
//                 "latitude": 52.49279312942881
//             },
//             "originDate": null,
//             "targetDate": null
//         },
//         "durations": {
//             "TRAIN": 8.41080593413881,
//             "LOCAL_TRANSPORTATION": 3844.9837076731774
//         },
//         "score": "ORANGE"
//     },
//     {
//         "greenRecord": {
//             "id": 44,
//             "meansOfTransportation": "ECAR",
//             "createdDate": "2019-10-26T15:09:31.786+0000",
//             "greenUser": {
//                 "id": 1,
//                 "username": "Greta Tom Winter",
//                 "avatarUrl": "https://cdn0.iconfinder.com/data/icons/avatars-19/64/_hipster_girl-512.png",
//                 "createdDate": "2019-10-26T00:00:00.000+0000",
//                 "footprint": 2000,
//                 "vehicleSerialNumber": null,
//                 "dbUserToken": {
//                     "id": 1,
//                     "refreshToken": "eyJhbGciOiJub25lIn0.eyJleHAiOjE1Nzk4NjIxNzEsImp0aSI6IjcxNzYxZTYxLTNhZTMtNDMzZC1hMThiLTM5OGU1ZWZkYmQwNCJ9.",
//                     "userAccounts": [
//                         {
//                             "iban": "DE10010000000000005354",
//                             "numTransactions": 20
//                         }
//                     ]
//                 },
//                 "greenRecords": []
//             },
//             "origin": {
//                 "id": 45,
//                 "longitude": 71.47036,
//                 "latitude": 51.160522
//             },
//             "target": {
//                 "id": 46,
//                 "longitude": 71.59738394549434,
//                 "latitude": 51.38114640626238
//             },
//             "originDate": null,
//             "targetDate": null
//         },
//         "durations": {
//             "TRAIN": 0.9778249302664321,
//             "LOCAL_TRANSPORTATION": 33.53356773834755
//         },
//         "score": "ORANGE"
//     },
//     {
//         "greenRecord": {
//             "id": 47,
//             "meansOfTransportation": "CAR",
//             "createdDate": "2019-10-26T15:09:36.785+0000",
//             "greenUser": {
//                 "id": 1,
//                 "username": "Greta Tom Winter",
//                 "avatarUrl": "https://cdn0.iconfinder.com/data/icons/avatars-19/64/_hipster_girl-512.png",
//                 "createdDate": "2019-10-26T00:00:00.000+0000",
//                 "footprint": 2000,
//                 "vehicleSerialNumber": null,
//                 "dbUserToken": {
//                     "id": 1,
//                     "refreshToken": "eyJhbGciOiJub25lIn0.eyJleHAiOjE1Nzk4NjIxNzEsImp0aSI6IjcxNzYxZTYxLTNhZTMtNDMzZC1hMThiLTM5OGU1ZWZkYmQwNCJ9.",
//                     "userAccounts": [
//                         {
//                             "iban": "DE10010000000000005354",
//                             "numTransactions": 20
//                         }
//                     ]
//                 },
//                 "greenRecords": []
//             },
//             "origin": {
//                 "id": 48,
//                 "longitude": 71.47036,
//                 "latitude": 51.160522
//             },
//             "target": {
//                 "id": 49,
//                 "longitude": 71.53165593513503,
//                 "latitude": 51.1813203450952
//             },
//             "originDate": null,
//             "targetDate": null
//         },
//         "durations": {
//             "TRAIN": 0.9367559428346826,
//             "LOCAL_TRANSPORTATION": 0.3887312043139387
//         },
//         "score": "RED"
//     },
//     {
//         "greenRecord": {
//             "id": 60,
//             "meansOfTransportation": "TRAIN",
//             "createdDate": "2019-10-26T15:09:41.789+0000",
//             "greenUser": {
//                 "id": 1,
//                 "username": "Greta Tom Winter",
//                 "avatarUrl": "https://cdn0.iconfinder.com/data/icons/avatars-19/64/_hipster_girl-512.png",
//                 "createdDate": "2019-10-26T00:00:00.000+0000",
//                 "footprint": 2000,
//                 "vehicleSerialNumber": null,
//                 "dbUserToken": {
//                     "id": 1,
//                     "refreshToken": "eyJhbGciOiJub25lIn0.eyJleHAiOjE1Nzk4NjIxNzEsImp0aSI6IjcxNzYxZTYxLTNhZTMtNDMzZC1hMThiLTM5OGU1ZWZkYmQwNCJ9.",
//                     "userAccounts": [
//                         {
//                             "iban": "DE10010000000000005354",
//                             "numTransactions": 20
//                         }
//                     ]
//                 },
//                 "greenRecords": []
//             },
//             "origin": {
//                 "id": 61,
//                 "longitude": 71.47036,
//                 "latitude": 51.160522
//             },
//             "target": {
//                 "id": 62,
//                 "longitude": 71.48112661240405,
//                 "latitude": 51.15842136945056
//             },
//             "originDate": null,
//             "targetDate": null
//         },
//         "durations": {
//             "TRAIN": 0.2716835449342417,
//             "LOCAL_TRANSPORTATION": 0.07634724294404345
//         },
//         "score": "ORANGE"
//     },
//     {
//         "greenRecord": {
//             "id": 63,
//             "meansOfTransportation": "FLIGHT",
//             "createdDate": "2019-10-26T15:09:46.785+0000",
//             "greenUser": {
//                 "id": 1,
//                 "username": "Greta Tom Winter",
//                 "avatarUrl": "https://cdn0.iconfinder.com/data/icons/avatars-19/64/_hipster_girl-512.png",
//                 "createdDate": "2019-10-26T00:00:00.000+0000",
//                 "footprint": 2000,
//                 "vehicleSerialNumber": null,
//                 "dbUserToken": {
//                     "id": 1,
//                     "refreshToken": "eyJhbGciOiJub25lIn0.eyJleHAiOjE1Nzk4NjIxNzEsImp0aSI6IjcxNzYxZTYxLTNhZTMtNDMzZC1hMThiLTM5OGU1ZWZkYmQwNCJ9.",
//                     "userAccounts": [
//                         {
//                             "iban": "DE10010000000000005354",
//                             "numTransactions": 20
//                         }
//                     ]
//                 },
//                 "greenRecords": []
//             },
//             "origin": {
//                 "id": 64,
//                 "longitude": 71.47036,
//                 "latitude": 51.160522
//             },
//             "target": {
//                 "id": 65,
//                 "longitude": 71.44806412711888,
//                 "latitude": 51.18331294976042
//             },
//             "originDate": null,
//             "targetDate": null
//         },
//         "durations": {
//             "TRAIN": 0.7834185793524407,
//             "LOCAL_TRANSPORTATION": 0.2378378513426039
//         },
//         "score": "RED"
//     },
//     {
//         "greenRecord": {
//             "id": 66,
//             "meansOfTransportation": "LOCAL_TRANSPORTATION",
//             "createdDate": "2019-10-26T15:09:51.786+0000",
//             "greenUser": {
//                 "id": 1,
//                 "username": "Greta Tom Winter",
//                 "avatarUrl": "https://cdn0.iconfinder.com/data/icons/avatars-19/64/_hipster_girl-512.png",
//                 "createdDate": "2019-10-26T00:00:00.000+0000",
//                 "footprint": 2000,
//                 "vehicleSerialNumber": null,
//                 "dbUserToken": {
//                     "id": 1,
//                     "refreshToken": "eyJhbGciOiJub25lIn0.eyJleHAiOjE1Nzk4NjIxNzEsImp0aSI6IjcxNzYxZTYxLTNhZTMtNDMzZC1hMThiLTM5OGU1ZWZkYmQwNCJ9.",
//                     "userAccounts": [
//                         {
//                             "iban": "DE10010000000000005354",
//                             "numTransactions": 20
//                         }
//                     ]
//                 },
//                 "greenRecords": []
//             },
//             "origin": {
//                 "id": 67,
//                 "longitude": 71.47036,
//                 "latitude": 51.160522
//             },
//             "target": {
//                 "id": 68,
//                 "longitude": 74.10927389081903,
//                 "latitude": 50.22484481704433
//             },
//             "originDate": null,
//             "targetDate": null
//         },
//         "durations": {
//             "TRAIN": 7.987587339242678,
//             "LOCAL_TRANSPORTATION": 3459.1975111005263
//         },
//         "score": "ORANGE"
//     }
// ]

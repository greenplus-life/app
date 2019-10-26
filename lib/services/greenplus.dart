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

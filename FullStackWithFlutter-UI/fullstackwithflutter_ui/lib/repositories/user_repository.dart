import 'package:fullstackwithflutter_ui/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class IUserRepository {
  Future<UserListResponse> fetchUsersList();
}

class UserRepository implements IUserRepository {
  final _host = "https://10.0.2.2:5001/api/User/";
  final Map<String, String> _headers = {
    "Accept": "application/json",
    "content-type": "application/json",
  };

  @override
  Future<UserListResponse> fetchUsersList() async {
    var getAllUsersUrl = _host + "GetAll";
    print("Request URL: $getAllUsersUrl");
    var results = await http.get(Uri.parse(getAllUsersUrl), headers: _headers);
    // print(results);
    final jsonObject = json.decode(results.body);
    var response = UserListResponse.fromJson(jsonObject);
    return response;
  }
}

import 'package:fullstackwithflutter_ui/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class IUserRepository {
  Future<UserListResponse> fetchUsersList();
}

class UserRepository implements IUserRepository {
  final _host = "https://10.0.2.2:44370/api/User/";
  final Map<String, String> _headers = {
    "Accept": "application/json",
    "contect-type": "application/json",
  };

  @override
  Future<UserListResponse> fetchUsersList() async {
    var getAllUsersUrl = _host + "GetAll";
    var results = await http.get(Uri.parse(getAllUsersUrl), headers: _headers);
    final jsonObject = json.decode(results.body);
    var response = UserListResponse.fromJson(jsonObject);
    return response;
  }
}

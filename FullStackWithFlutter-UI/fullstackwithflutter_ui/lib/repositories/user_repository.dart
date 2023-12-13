import 'dart:io';

import 'package:fullstackwithflutter_ui/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class IUserRepository {
  Future<UserListResponse> fetchUsersList();
  Future<UserResponse> createNewUser(User user);
  Future<UserResponse> getUserById(int userId);
}

class UserRepository implements IUserRepository {
  final _host = "https://10.0.2.2:5001/api/User/";
  final Map<String, String> _headers = {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json",
  };

  @override
  Future<UserListResponse> fetchUsersList() async {
    var getAllUsersUrl = _host + "GetAll";
    // print("Request URL: $getAllUsersUrl");
    var results = await http.get(Uri.parse(getAllUsersUrl), headers: _headers);
    // print(results);
    final jsonObject = json.decode(results.body);
    var response = UserListResponse.fromJson(jsonObject);
    return response;
  }

  @override
  Future<UserResponse> createNewUser(User user) async {
    var url = _host + "Create";
    var _body = json.encode(user);
    var results = await http.post(Uri.parse(url),
        body: _body, headers: _headers, encoding: Encoding.getByName("utf-8"));

    final jsonObject = json.decode(results.body);
    var response = UserResponse.fromJson(jsonObject);
    return response;
  }

  @override
  Future<UserResponse> getUserById(int userId) async {
    var url = _host + userId.toString();
    // print("Request URL: $getAllUsersUrl");
    var results = await http.get(Uri.parse(url), headers: _headers);
    // print(results);
    final jsonObject = json.decode(results.body);
    var response = UserResponse.fromJson(jsonObject);
    return response;
  }
}

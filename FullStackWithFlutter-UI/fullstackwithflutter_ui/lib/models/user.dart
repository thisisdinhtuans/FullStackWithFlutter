// class UserListResponse {
//   UserListResponse({
//     required this.status,
//     required this.message,
//     required this.data,
//   });
//   late final bool status;
//   late final String message;
//   late final List<User> data;

//   UserListResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = List.from(json['data']).map((e) => User.fromJson(e)).toList();
//   }
//   Map<String, dynamic> toJson {
//     final _data=<String, dynamic>{};
//     _data['status']=status;
//     _data['message']=message;
//     _data['data']=data.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }
class UserListResponse {
  UserListResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final List<User> data;

  factory UserListResponse.fromJson(Map<String, dynamic> json) {
    return UserListResponse(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<User>.from(json["data"]!.map((x) => User.fromJson(x))),
    );
  }
}

class User {
  User({
    required this.id,
    required this.fullName,
    required this.mobileNumber,
  });

  final int? id;
  final String fullName;
  final String mobileNumber;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      fullName: json["fullName"],
      mobileNumber: json["mobileNumber"],
    );
  }
}

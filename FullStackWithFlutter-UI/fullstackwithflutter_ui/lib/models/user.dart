class UserResponse {
  UserResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final List<User> data;

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
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
  final String? fullName;
  final String? mobileNumber;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      fullName: json["fullName"],
      mobileNumber: json["mobileNumber"],
    );
  }
}

class UserModel {
  final String email;
  final String password;
  final String country;
  final String phone;

  UserModel({
    required this.email,
    required this.password,
    required this.country,
    required this.phone,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      email: data["email"],
      password: data["password"],
      country: data["country"],
      phone: data["phone"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "country": country,
      "phone": phone,
    };
  }
}

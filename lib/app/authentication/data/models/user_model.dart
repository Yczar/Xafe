class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  UserModel.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        email = data['email'];
  final String id;
  final String name;
  String password;
  final String email;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}

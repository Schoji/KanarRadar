class UserModel {
  final String id;
  final String city;
  final String name;
  final String email;

  UserModel({
    required this.id,
    required this.city,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'city': city, 'name': name, 'email': email};
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      city: map['city'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }
}

class User {
  final int id;
  final String username;
  final String name;
  final String? email;
  final Map<String, dynamic>? address;

  User({required this.id, required this.username, required this.name, this.email = '', this.address});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: json['address'],  
    );
  }
}
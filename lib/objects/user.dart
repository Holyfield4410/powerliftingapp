class User {
  int? id; // Marking id as nullable
  String username;
  String password;
  String email;
  String firstName;
  String lastName;

  User({
    this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      password: map['password'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}

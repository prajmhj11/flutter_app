class User {
  final int id;
  final String name;
  final String firstName;
  final String lastName;
  final String email;
  final String bio;
  final String profilePicture;

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        name = json['name'] ?? '',
        firstName = json['firstName'] ?? '',
        lastName = json['lastName'] ?? '',
        email = json['email'] ?? '',
        bio = json['bio'] ?? '',
        profilePicture = json['profilePicture'] ?? '';

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'bio': bio,
        'profilePicture': profilePicture
      };
}

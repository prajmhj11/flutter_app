class User {
  final int id;
  final String name;
  final String email;
  final String bio;
  final String profilePicture;

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        name = json['name'] ?? '',
        email = json['email'] ?? '',
        bio = json['bio'] ?? '',
        profilePicture = json['profilePicture'] ?? '';
}

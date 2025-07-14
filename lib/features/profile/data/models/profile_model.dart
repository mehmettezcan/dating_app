class ProfileModel {
  final String id;
  final String name;
  final String email;
  final String photoUrl;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'photoUrl': photoUrl};
  }
}

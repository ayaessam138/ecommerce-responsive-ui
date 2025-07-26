class ProfileModel {
  final String email;
  final String name;
  final String image;
  final int age;

  ProfileModel({
    required this.email,
    required this.name,
    required this.image,
    required this.age,
  });

  // ✅ fromJson
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      email: json['email'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      age: json['age'] as int,
    );
  }

  // ✅ toJson
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'image': image,
      'age': age,
    };
  }
}

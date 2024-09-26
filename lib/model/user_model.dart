class UserModel {
  final int? id;
  final String? avatar_url;
  final String? login;
  final String? name;
  final String? bio;

  UserModel({
    this.id,
    this.avatar_url,
    this.login,
    this.name,
    this.bio,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      avatar_url: map['avatar_url'],
      login: map['login'],
      name: map['name'],
      bio: map['bio'],
    );
  }

  Map<String, dynamic> toJson(UserModel userModel) {
    return {
      "id": userModel.id,
      "avatar_url": userModel.avatar_url,
      "login": userModel.login,
      "name": userModel.name,
      "bio": userModel.bio,
    };
  }
}

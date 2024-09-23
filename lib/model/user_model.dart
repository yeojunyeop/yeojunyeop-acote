class UserModel {
  final String? avatar_url;
  final String? login;
  final String? name;
  final String? bio;

  UserModel({
    this.avatar_url,
    this.login,
    this.name,
    this.bio,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      avatar_url: map['avatar_url'],
      login: map['login'],
      name: map['name'],
      bio: map['bio'],
    );
  }

  Map<String, dynamic> toJson(UserModel userModel) {
    return {
      "avatar_url": userModel.avatar_url,
      "login": userModel.login,
      "name": userModel.name,
      "bio": userModel.bio,
    };
  }
}

class UserModel {
  final int? id;
  final String? avatar_url;
  final String? login;

  UserModel({
    this.id,
    this.avatar_url,
    this.login,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      avatar_url: map['avatar_url'],
      login: map['login'],
    );
  }
}

import 'package:dio/dio.dart';
import 'package:yeojunyeop_acote/model/user_model.dart';

class Functions {
  static final Functions instance = Functions._initialize();
  late final Dio dio;

  factory Functions() {
    return instance;
  }

  Functions._initialize() {
    dio = Dio();
  }

  Future getUsersData([int lastUserId = 0]) async {
    var response = await dio.get(
      'https://api.github.com/users',
      queryParameters: {
        'since': lastUserId,
      },
    );
    List<UserModel> result = [];
    response.data.forEach((value) {
      result.add(UserModel.fromJson(value));
    });
    return result;
  }
}

import 'package:get/get.dart';
import 'package:yeojunyeop_acote/model/user_detail_model.dart';
import 'package:yeojunyeop_acote/provider/functions.dart';

class UserDetailViewModel extends GetxController {
  static UserDetailViewModel get to => Get.find<UserDetailViewModel>();

  List<UserDetailModel> repositoryList = [];

  Future<void> getUserDetail(String userName) async {
    repositoryList = await Functions.instance.getUserDetail(userName);
    update();
  }
}

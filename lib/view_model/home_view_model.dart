import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeojunyeop_acote/model/user_model.dart';

import '../provider/functions.dart';

class HomeViewModel extends GetxController {
  static HomeViewModel get to => Get.find<HomeViewModel>();

  List<UserModel> userList = [];

  Future<void> getUser() async {
    try {
      userList = await Functions.instance.getUsersData();
      update();
    } catch (e) {
      debugPrint('errorMessage: $e');
    }
  }
}

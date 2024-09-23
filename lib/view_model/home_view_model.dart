import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yeojunyeop_acote/model/user_model.dart';
import 'package:yeojunyeop_acote/provider/functions.dart';

class HomeViewModel extends GetxController {
  static HomeViewModel get to => Get.find<HomeViewModel>();

  List<UserModel> userList = [];
  LaunchMode launchMode = LaunchMode.platformDefault;

  @override
  void onInit() async {
    super.onInit();
    if (Platform.isAndroid) {
      launchMode = LaunchMode.externalApplication;
    }
  }

  Future<void> getUser() async {
    try {
      userList = await Functions.instance.getUsersData();
      update();
    } catch (e) {
      debugPrint('errorMessage: $e');
    }
  }

  Future<void> launchAdUrl() async {
    Uri url = Uri.parse('https://taxrefundgo.kr');
    launchUrl(url, mode: launchMode);
  }
}

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
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void onInit() async {
    super.onInit();
    if (Platform.isAndroid) {
      launchMode = LaunchMode.externalApplication;
    }

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          isLoading == false) {
        getUsers();
      }
    });
  }

  Future<void> getUsers() async {
    if (userList.isEmpty) {
      userList = await Functions.instance.getUsersData();
    } else {
      isLoading = true;
      update();
      List<UserModel> moreUserList =
          await Functions.instance.getUsersData(userList.last.id!);
      userList.addAll(moreUserList);
      isLoading = false;
    }
    update();
  }

  Future<void> launchAdUrl() async {
    Uri url = Uri.parse('https://taxrefundgo.kr');
    launchUrl(url, mode: launchMode);
  }
}

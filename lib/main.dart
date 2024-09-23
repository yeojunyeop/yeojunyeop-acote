import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeojunyeop_acote/ui/home.dart';
import 'package:yeojunyeop_acote/view_model/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => const Home(),
          binding: BindingsBuilder(() {
            Get.put(HomeViewModel());
          }),
        ),
      ],
    );
  }
}

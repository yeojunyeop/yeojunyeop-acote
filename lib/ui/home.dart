import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeojunyeop_acote/view_model/home_view_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    HomeViewModel.to.getUser();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xff17181a),
        scrolledUnderElevation: 0,
        toolbarHeight: 40,
        shape: const Border(
          bottom: BorderSide(
            color: Color(0xff393a3e),
            width: 1,
          ),
        ),
        title: const Text(
          '사용자',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<HomeViewModel>(
        builder: (_) {
          return RawScrollbar(
            thumbColor: const Color(0xff8a8a8c),
            thickness: 3,
            radius: const Radius.circular(20),
            crossAxisMargin: 3,
            child: ListView.builder(
              itemCount: HomeViewModel.to.userList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      color: const Color(0xff17181a),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.blue,
                            backgroundImage: NetworkImage(
                                HomeViewModel.to.userList[index].avatar_url!),
                          ),
                          const SizedBox(width: 12),
                          Text(HomeViewModel.to.userList[index].login!,
                              style: const TextStyle(
                                  color: Color(0xff989aa6), fontSize: 16)),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        if(HomeViewModel.to.userList.length != index)
                          Container(
                              color: const Color(0xff17181a),
                              height: 1,
                              width: 72),
                        Expanded(
                            child: Container(
                                color: const Color(0xff202125), height: 1)),
                      ],
                    )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

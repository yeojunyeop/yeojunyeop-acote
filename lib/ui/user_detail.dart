import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeojunyeop_acote/view_model/user_detail_view_model.dart';

class UserDetail extends StatefulWidget {
  final String userName;

  const UserDetail({super.key, required this.userName});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  void initState() {
    super.initState();
    UserDetailViewModel.to.getUserDetail(widget.userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xff17181a),
        scrolledUnderElevation: 0,
        toolbarHeight: 40,
        leadingWidth: 80,
        shape: const Border(
          bottom: BorderSide(
            color: Color(0xff393a3e),
            width: 1,
          ),
        ),
        leading: TextButton(
          onPressed: () => Get.back(),
          child: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                    width: 20,
                    child:
                        Icon(Icons.arrow_back_ios, color: Color(0xff2e8fff))),
                Text(
                  '뒤로',
                  style: TextStyle(color: Color(0xff2e8fff), fontSize: 18),
                ), // 텍스트 설정
              ],
            ),
          ),
        ),
        title: const Text(
          '리포지토리',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: GetBuilder<UserDetailViewModel>(
        builder: (_) => RawScrollbar(
          thumbColor: const Color(0xff8a8a8c),
          thickness: 3,
          radius: const Radius.circular(20),
          crossAxisMargin: 3,
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(bottom: 120),
                      sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                        childCount:
                            UserDetailViewModel.to.repositoryList.length,
                        (context, index) {
                          if (UserDetailViewModel.to.repositoryList.isEmpty) {
                            return const SizedBox.shrink();
                          } else {
                            return repositoryTile(index);
                          }
                        },
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget repositoryTile(int index) {
    return Column(
      children: [
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {},
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: const Color(0xff17181a),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(UserDetailViewModel.to.repositoryList[index].name!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                if (UserDetailViewModel.to.repositoryList[index].description !=
                    null)
                  Text(
                      UserDetailViewModel.to.repositoryList[index].description!,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 16)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star_border,
                          color: Color(0xff989aa6),
                          size: 20,
                        ),
                        const SizedBox(width: 2),
                        Text(
                            UserDetailViewModel
                                .to.repositoryList[index].watchers_count!
                                .toString(),
                            style: const TextStyle(
                                color: Color(0xff989aa6),
                                fontSize: 16,
                                height: 1)),
                      ],
                    ),
                    if (UserDetailViewModel.to.repositoryList[index].language !=
                        null)
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          Icon(
                            Icons.circle,
                            color: UserDetailViewModel
                                .to.repositoryList[index].getColor,
                            size: 16,
                          ),
                          const SizedBox(width: 2),
                          Text(
                              UserDetailViewModel
                                  .to.repositoryList[index].language!,
                              style: const TextStyle(
                                  color: Color(0xff989aa6),
                                  fontSize: 16,
                                  height: 1)),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            if (UserDetailViewModel.to.repositoryList.length - 1 != index)
              Container(color: const Color(0xff17181a), height: 1, width: 16),
            Expanded(
                child: Container(color: const Color(0xff202125), height: 1)),
          ],
        )
      ],
    );
  }
}

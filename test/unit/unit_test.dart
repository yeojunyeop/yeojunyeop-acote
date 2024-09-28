import 'package:flutter_test/flutter_test.dart';
import 'package:yeojunyeop_acote/view_model/home_view_model.dart';

void main() {
  test('유저리스트가 비어있는 경우 유저리스트가 채워지는지 확인 및 유저리스트를 추가하는 경우 확인', () async {
    final homeViewModel = HomeViewModel();

    expect(homeViewModel.userList.isEmpty, true);

    await homeViewModel.getUsers();

    expect(homeViewModel.userList.isNotEmpty, true);

    int userListLength = homeViewModel.userList.length;

    await homeViewModel.getUsers();

    expect(homeViewModel.userList.length, greaterThan(userListLength));
  });
}

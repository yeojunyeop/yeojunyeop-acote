import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:yeojunyeop_acote/main.dart' as app;
import 'package:yeojunyeop_acote/view_model/home_view_model.dart';
import 'package:yeojunyeop_acote/view_model/user_detail_view_model.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  final homeViewModel = HomeViewModel();
  final userDetailViewModel = UserDetailViewModel();

  testWidgets('home화면에 유저리스트 UI 테스트 및 유저리스트 클릭 시 저장소 화면 UI 테스트',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('사용자'), findsOneWidget);

    await homeViewModel.getUsers();

    await tester.pumpAndSettle();

    expect(find.byType(Ink), findsWidgets);

    await tester.tap(find.byType(Ink).first, warnIfMissed: false);

    await tester.pumpAndSettle();

    expect(find.byType(AppBar), findsOneWidget);

    await userDetailViewModel.getUserDetail('mojombo');

    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.star_border), findsWidgets);
  });
}

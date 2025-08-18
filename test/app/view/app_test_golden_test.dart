import 'package:app/app/view/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import '../../helpers/pump_app.dart';

void main() {
  group(MailItem, () {
    testGoldens('renders $MailItem', (tester) async {
      await mockNetworkImages(() async {
        await tester.pumpApp(const MailItem());
        await tester.binding.setSurfaceSize(const Size(400, 80));
      });
      await screenMatchesGolden(tester, 'mail_item');
    });

    testGoldens('renders unread $MailItem', (tester) async {
      await mockNetworkImages(() async {
        await tester.binding.setSurfaceSize(const Size(400, 80));
        await tester.pumpApp(const MailItem(isRead: false));
      });
      await screenMatchesGolden(tester, 'mail_item_unread');
    });

    testGoldens('renders unread favorite $MailItem', (tester) async {
      await mockNetworkImages(() async {
        await tester.binding.setSurfaceSize(const Size(400, 80));
        await tester.pumpApp(const MailItem(isRead: false, isFavorite: true));
      });
      await screenMatchesGolden(tester, 'mail_item_unread_favorite');
    });
  });
  testGoldens('renders $App', (tester) async {
    await mockNetworkImages(() async {
      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(const App());
    });

    await screenMatchesGolden(tester, 'app');
  });
}

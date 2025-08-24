import 'package:app/app/view/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import '../../helpers/pump_app.dart';

void main() {
  group(MailItem, () {
    group('flutter_test', () {
      testWidgets('renders $MailItem', (tester) async {
        /// Set surface size
        await tester.binding.setSurfaceSize(const Size(400, 80));

        /// Reset surface size
        addTearDown(() async {
          await tester.binding.setSurfaceSize(null);
        });

        /// Pump the app
        await mockNetworkImages(() async {
          await tester.pumpApp(const MailItem());
        });
        expect(
          find.byType(MailItem),
          matchesGoldenFile('goldens/flutter_test/mail_item_flutter_test.png'),
        );
      });
      testWidgets('renders unread $MailItem', (tester) async {
        /// Set surface size
        await tester.binding.setSurfaceSize(const Size(400, 80));

        /// Reset surface size
        addTearDown(() async {
          await tester.binding.setSurfaceSize(null);
        });
        await mockNetworkImages(() async {
          await tester.pumpApp(const MailItem(isRead: false));
        });
        expect(
          find.byType(MailItem),
          matchesGoldenFile(
            'goldens/flutter_test/mail_item_unread_flutter_test.png',
          ),
        );
      });
      testWidgets('renders unread favorite $MailItem', (tester) async {
        /// Set surface size
        await tester.binding.setSurfaceSize(const Size(400, 80));

        /// Reset surface size
        addTearDown(() async {
          await tester.binding.setSurfaceSize(null);
        });

        await mockNetworkImages(() async {
          await tester.pumpApp(const MailItem(isRead: false, isFavorite: true));
        });
        expect(
          find.byType(MailItem),
          matchesGoldenFile(
            'goldens/flutter_test/mail_item_unread_favorite_flutter_test.png',
          ),
        );
      });
      testWidgets('renders read $MailItem', (tester) async {
        /// Set surface size
        await tester.binding.setSurfaceSize(const Size(400, 80));

        /// Reset surface size
        addTearDown(() async {
          await tester.binding.setSurfaceSize(null);
        });

        await mockNetworkImages(() async {
          await tester.pumpApp(const MailItem());
        });
        expect(
          find.byType(MailItem),
          matchesGoldenFile(
            'goldens/flutter_test/mail_item_read_flutter_test.png',
          ),
        );
      });
    });
    group('golden_toolkit', () {
      testGoldens('renders $MailItem', (tester) async {
        await mockNetworkImages(() async {
          await tester.pumpApp(const MailItem());
          await tester.binding.setSurfaceSize(const Size(400, 80));
        });
        await screenMatchesGolden(
          tester,
          'golden_toolkit/mail_item_golden_toolkit',
        );
      });

      testGoldens('renders unread $MailItem', (tester) async {
        await mockNetworkImages(() async {
          await tester.binding.setSurfaceSize(const Size(400, 80));
          await tester.pumpApp(const MailItem(isRead: false));
        });
        await screenMatchesGolden(
          tester,
          'golden_toolkit/mail_item_unread_golden_toolkit',
        );
      });

      testGoldens('renders unread favorite $MailItem', (tester) async {
        await mockNetworkImages(() async {
          await tester.binding.setSurfaceSize(const Size(400, 80));
          await tester.pumpApp(const MailItem(isRead: false, isFavorite: true));
        });
        await screenMatchesGolden(
          tester,
          'golden_toolkit/mail_item_unread_favorite_golden_toolkit',
        );
      });
    });

    group(App, () {
      group('flutter_test', () {
        testWidgets('renders $App', (tester) async {
          /// Set surface size
          await tester.binding.setSurfaceSize(const Size(400, 800));

          /// Reset surface size
          addTearDown(() async {
            await tester.binding.setSurfaceSize(null);
          });

          await mockNetworkImages(() async {
            await tester.pumpWidget(const App());
          });
          expect(
            find.byType(App),
            matchesGoldenFile('goldens/flutter_test/app_flutter_test.png'),
          );
        });
      });

      group('golden_toolkit', () {
        testGoldens('renders $App', (tester) async {
          /// Set surface size
          await tester.binding.setSurfaceSize(const Size(400, 800));

          /// Reset surface size
          addTearDown(() async {
            await tester.binding.setSurfaceSize(null);
          });

          await mockNetworkImages(() async {
            await tester.pumpWidget(const App());
          });

          await screenMatchesGolden(
            tester,
            'golden_toolkit/app_golden_toolkit',
          );
        });
      });
    });
  });
}

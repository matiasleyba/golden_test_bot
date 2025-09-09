import 'package:alchemist/alchemist.dart';
import 'package:app/app/view/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import '../../helpers/pump_app.dart';

void main() {
  group('MailItem golden', () {
    group('flutter_test', skip: false, () {
      testWidgets('renders unread $MailItem', tags: 'golden', (tester) async {
        /// Set surface size
        await tester.binding.setSurfaceSize(const Size(400, 80));

        /// Reset surface size
        addTearDown(() async {
          await tester.binding.setSurfaceSize(null);
        });

        await mockNetworkImages(() async {
          await tester.pumpApp(
            const MailItem(
              isRead: false,
              conversationCount: 2,
            ),
          );
        });

        await expectLater(
          find.byType(MailItem),
          matchesGoldenFile(
            'goldens/mail_item_unread_flutter_test.png',
          ),
        );
      });
      testWidgets('renders unread favorite $MailItem', tags: 'golden', (
        tester,
      ) async {
        /// Set surface size
        await tester.binding.setSurfaceSize(const Size(400, 80));

        /// Reset surface size
        addTearDown(() async {
          await tester.binding.setSurfaceSize(null);
        });

        await mockNetworkImages(() async {
          await tester.pumpApp(const MailItem(isRead: false, isFavorite: true));
        });

        await expectLater(
          find.byType(MailItem),
          matchesGoldenFile(
            'goldens/mail_item_unread_favorite_flutter_test.png',
          ),
        );
      });
      testWidgets('renders read $MailItem', tags: 'golden', (tester) async {
        /// Set surface size
        await tester.binding.setSurfaceSize(const Size(400, 80));

        /// Reset surface size
        addTearDown(() async {
          await tester.binding.setSurfaceSize(null);
        });

        await mockNetworkImages(() async {
          await tester.pumpApp(const MailItem());
        });

        await expectLater(
          find.byType(MailItem),
          matchesGoldenFile(
            'goldens/mail_item_read_flutter_test.png',
          ),
        );
      });
    });

    group('golden_toolkit', skip: true, () {
      testGoldens('renders $MailItem variants correctly', (tester) async {
        /// Set surface size
        await tester.binding.setSurfaceSize(const Size(400, 80));

        /// Reset surface size
        addTearDown(() async {
          await tester.binding.setSurfaceSize(null);
        });
        final goldenBuilder = GoldenBuilder.column()
          ..addScenario(
            'read',
            const MailItem(),
          )
          ..addScenario(
            'unread',
            const MailItem(isRead: false),
          )
          ..addScenario(
            'unread favorite',
            const MailItem(isRead: false, isFavorite: true),
          );
        await mockNetworkImages(() async {
          await tester.pumpWidgetBuilder(goldenBuilder.build());
        });

        await screenMatchesGolden(
          tester,
          'golden_toolkit/mail_item_golden_toolkit',
        );
      });
    });

    group('alchemist', skip: true, () {
      goldenTest(
        'renders $MailItem variants',
        fileName: 'mail_item',
        pumpWidget: (tester, widget) async {
          await mockNetworkImages(() async {
            await tester.pumpWidget(widget);
          });
        },
        builder: () => GoldenTestGroup(
          children: [
            GoldenTestScenario(
              name: 'read',
              child: const MailItem(
                conversationCount: 2,
              ),
            ),
            GoldenTestScenario(
              name: 'unread',
              child: const MailItem(isRead: false),
            ),
            GoldenTestScenario(
              name: 'unread favorite',
              child: const MailItem(isRead: false, isFavorite: true),
            ),
          ],
        ),
      );
    });
  });

  /*
  group(GmailInboxPage, skip: false, () {
    group('flutter_test $GmailInboxPage', () {
      testWidgets('renders $GmailInboxPage', (tester) async {
        /// Set surface size
        await tester.binding.setSurfaceSize(const Size(400, 800));

        /// Reset surface size
        addTearDown(() async {
          await tester.binding.setSurfaceSize(null);
        });

        await mockNetworkImages(() async {
          await tester.pumpWidget(
            const MaterialApp(home: GmailInboxPage()),
          );
        });
        expect(
          find.byType(GmailInboxPage),
          matchesGoldenFile('goldens/flutter_test/app_flutter_test.png'),
        );
      });
    });

    group('golden_toolkit $GmailInboxPage', () {
      testGoldens('renders $GmailInboxPage', (tester) async {
        /// Set surface size
        await tester.binding.setSurfaceSize(const Size(400, 800));

        /// Reset surface size
        addTearDown(() async {
          await tester.binding.setSurfaceSize(null);
        });

        await mockNetworkImages(() async {
          await tester.pumpWidget(
            const App(),
          );
        });

        await screenMatchesGolden(
          tester,
          'golden_toolkit/app_golden_toolkit',
        );
      });
    });

    group('alchemist $GmailInboxPage', () {
      goldenTest(
        'renders $GmailInboxPage',
        fileName: 'app_alchemist',
        skip: true,
        pumpWidget: (tester, widget) async {
          await mockNetworkImages(() async {
            await tester.pumpWidget(
              widget,
            );
          });
        },
        builder: () => GoldenTestGroup(
          scenarioConstraints: BoxConstraints.tight(
            const Size(500, 800),
          ),
          children: [
            GoldenTestScenario(
              name: 'app',
              child: const App(),
            ),
          ],
        ),
      );
    });
  });
     */
}

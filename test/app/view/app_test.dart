import 'package:app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../helpers/helpers.dart';

void main() {
  group(App, skip: true, () {
    group(MailItem, () {
      testWidgets('renders an unread $MailItem', (tester) async {
        await mockNetworkImages(
          () async => tester.pumpApp(
            const MailItem(
              isRead: false,
              conversationCount: 3,
              isImportant: true,
            ),
          ),
        );

        /// Check the title
        expect(
          find.text('Welcome to Gmail - Here are some tips to get you started'),
          findsOneWidget,
        );

        /// Check the subtitle
        expect(
          find.text('Welcome to Gmail - Here are some tips to get you started'),
          findsOneWidget,
        );

        /// Check the text styles
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Text &&
                widget.style?.fontWeight == FontWeight.w700 &&
                widget.style?.color == Colors.black,
          ),
          findsNWidgets(3),
        );

        /// Check the conversation count
        expect(
          find.text('3'),
          findsOneWidget,
        );

        /// Check the favorites icon
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Icon &&
                widget.icon == Icons.star_border &&
                widget.color == Colors.grey,
          ),
          findsOneWidget,
        );

        /// Check the important icon
        expect(
          find.byWidgetPredicate(
            (widget) =>
                widget is Icon &&
                widget.icon == Icons.bookmark &&
                widget.color == Colors.yellow.shade700,
          ),
          findsOneWidget,
        );

        // TODO(matiasleyba): Check the position of the icons
        // TODO(matiasleyba): Check the position of the texts
        // TODO(matiasleyba): Check the size of the logo
        // TODO(matiasleyba): Check the paddings of the different elements
      });
    });
    testWidgets('renders $GmailInboxPage', (tester) async {
      await mockNetworkImages(() async => tester.pumpApp(const App()));
      expect(find.byType(GmailInboxPage), findsOneWidget);
    });
  });
}

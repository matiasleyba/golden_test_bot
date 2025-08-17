import 'package:app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

void main() {
  group('App', () {
    testWidgets('renders $GmailInboxPage', (tester) async {
      await mockNetworkImages(() async => tester.pumpWidget(const App()));
      expect(find.byType(GmailInboxPage), findsOneWidget);
    });
  });
}

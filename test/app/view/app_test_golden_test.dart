import 'dart:ui';

import 'package:app/app/view/app.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

void main() {
  testGoldens('renders $App', (tester) async {
    await mockNetworkImages(() async {
      await tester.pumpWidget(const App());
      await tester.binding.setSurfaceSize(const Size(300, 600));
    });

    await screenMatchesGolden(tester, 'app');
  });
}

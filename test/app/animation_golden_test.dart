import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /*
  testWidgets('$CircularProgressIndicator', skip: true, (tester) async {
    final animationSheet = AnimationSheetBuilder(
      frameSize: const Size(120, 100),
    );
    addTearDown(animationSheet.dispose);

    final widget = Material(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: Builder(
            builder: (context) {
              var value = 2024;
              return StatefulBuilder(
                builder: (context, setState) {
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      AnimatedFlipCounter(
                        duration: const Duration(milliseconds: 500),
                        value: value,
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            value++;
                          });
                        },
                        child: const Text('Increment'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );

    await tester.pumpFrames(
      animationSheet.record(widget, recording: false),
      const Duration(milliseconds: 1),
    );

    await tester.tap(find.byType(TextButton));

    await tester.pumpFrames(
      animationSheet.record(widget),
      const Duration(milliseconds: 585),
    );

    await expectLater(
      animationSheet.collate(5),
      matchesGoldenFile('goldens/animation_golden_test.png'),
    );
  });
  */
}

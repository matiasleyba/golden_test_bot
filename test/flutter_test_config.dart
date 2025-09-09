import 'dart:async';
import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  /*
  return GoldenToolkit.runWithConfiguration(
    () async {
      await testMain();
    },
  );
  */

  /*
  return AlchemistConfig.runWithConfig(
    config: AlchemistConfig.current().copyWith(
      goldenTestTheme: GoldenTestTheme(
        backgroundColor: Colors.white,
        borderColor: Colors.grey.shade200,
        nameTextStyle: const TextStyle(),
      ),
    ),
    run: testMain,
  );
  */

  return testMain();
}

import 'dart:async';
import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  /*
  return GoldenToolkit.runWithConfiguration(
    () async {
      //await loadAppFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(),
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
      ciGoldensConfig: const CiGoldensConfig(
        // ignore: avoid_redundant_argument_values
        obscureText: true,
      ),
    ),
    run: testMain,
  );
*/
  await loadAppFonts();
  return testMain();
}

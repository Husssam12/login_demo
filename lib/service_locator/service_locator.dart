import 'package:get_it/get_it.dart';

import 'features/_export.dart';

final si = GetIt.I;

Future<void> init() async {
  await core();
  await user();
}

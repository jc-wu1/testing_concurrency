import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'src/core/injector.dart';
import 'src/the_movie_db_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  debugRepaintRainbowEnabled = true; //   <-- set this flag to true

  runApp(const MyApp());
}

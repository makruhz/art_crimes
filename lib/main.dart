import 'dart:io';

import 'package:art_crimes/app.dart';
import 'package:art_crimes/models/art.dart';
import 'package:art_crimes/models/image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ArtAdapter());
  Hive.registerAdapter(ImageAdapter());
  await Hive.openBox<List<Art>>('arts');
  runApp(const App());
}

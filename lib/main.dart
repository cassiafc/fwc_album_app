import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/core/config/env/env.dart';
import 'app/fwc_album_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Env.i.load();
  runApp(FwcAlbumApp());
}





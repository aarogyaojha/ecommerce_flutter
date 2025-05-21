import 'package:ecommerce_flutter/app.dart';
import 'package:ecommerce_flutter/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  // Widgets Binding---------------------------------------------------

  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
      
  // Getx Local Strorage---------------------------------------------------
  await GetStorage.init();

  // TODO: Init Payment Methods---------------------------------------------------
  // TODO: Await Native Splash---------------------------------------------------

  // Initialize Firebase---------------------------------------------------

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  // TODO: Initialize Authetication---------------------------------------------------

  runApp(const App());
}

import 'dart:io';

import 'package:ekart/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'global/config/config.dart';
import 'global/dependency_injection/get_it.dart';
import 'global/providers/providers.dart';
import 'global/routes/routes.dart';

void main() async {
  setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //*--- Hive
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox<String>(Config.dbName);
  await Hive.openBox<List>(Config.productDb);
//*--- Screen_orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Platform.isIOS
            ? CupertinoApp(
                title: 'E-KART',
                routes: routes,
                initialRoute: '/',
                navigatorKey: navigationKey,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  DefaultWidgetsLocalizations.delegate,
                  DefaultMaterialLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate,
                ],
              )
            : MaterialApp(
                routes: routes,
                title: 'E-KART',
                initialRoute: '/',
                navigatorKey: navigationKey,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
              );
      },
      designSize: const Size(430, 932),
    );
  }
}

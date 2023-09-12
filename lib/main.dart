import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:furniture_shop/localization/localization_delegate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screen/1. Boarding/BoardingScreen.dart';
import 'Screen/2. Login - Signup/LoginSupplier.dart';
import 'Screen/2. Login - Signup/SignupSupplier.dart';
import 'Screen/4. SupplierHomeScreen/Screen/SupplierHomeScreen.dart';
import 'firebase_options.dart';

late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );
  SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ],
  ).then((value) => const MyApp());

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(Platform.localeName),
      localizationsDelegates: const <LocalizationsDelegate>[
        AppLocalizationDelegate(),
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale.fromSubtags(languageCode: 'vi'),
        Locale.fromSubtags(languageCode: 'en'),
      ],
      initialRoute: '/Welcome_boarding',
      routes: <String, WidgetBuilder>{
        '/Welcome_boarding': (BuildContext context) => const BoardingScreen(),
        '/Supplier_screen': (BuildContext context) =>
            const SupplierHomeScreen(),
        '/Login_sup': (BuildContext context) => const LoginSupplier(),
        '/Signup_sup': (BuildContext context) => const SignupSupplier(),
      },
    );
  }
}

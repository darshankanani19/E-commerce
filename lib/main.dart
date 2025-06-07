import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/views/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBfPtExEYRc4FbXMIwm4fXWe_mtUqSWEY0",
        authDomain: "e-commerce-ae66b.firebaseapp.com",
        projectId: "e-commerce-ae66b",
        storageBucket: "e-commerce-ae66b.appspot.com",
        messagingSenderId: "458220234216",
        appId: "e-commerce-ae66b",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(color: Colors.transparent),
        fontFamily: regular,
        iconTheme: IconThemeData(
          color: darkFontGrey
        ),

      ),
      home: SplashScreen(),
    );
  }
}

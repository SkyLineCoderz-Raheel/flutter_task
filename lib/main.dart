import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/views/screens/screen_login.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'constants/colors/colors.dart';
import 'constants/style/style.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  colorConfig();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
void colorConfig() {
  appPrimaryColor = MaterialColor(
    0xFFDF034D,
    const <int, Color>{
      50: const Color(0xFFDF034D),
      100: const Color(0xFFDF034D),
      200: const Color(0xFFDF034D),
      300: const Color(0xFFDF034D),
      400: const Color(0xFFDF034D),
      500: const Color(0xFFDF034D),
      600: const Color(0xFFDF034D),
      700: const Color(0xFFDF034D),
      800: const Color(0xFFDF034D),
      900: const Color(0xFFDF034D),
    },
  );
  appBoxShadow = [BoxShadow(blurRadius: 18, color: Color(0x414D5678))];
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: ScreenLogin(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,

      title: "Flutter Task",
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: appPrimaryColor,
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.white),
          fillColor: MaterialStateProperty.all(appPrimaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          side: BorderSide(color: Color(0xff585858), width: 1),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat"),
          centerTitle: false,
          systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: appPrimaryColor),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        dividerColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,

        backgroundColor: Color(0xFFFAFBFF),
      ),
    );
  }
}

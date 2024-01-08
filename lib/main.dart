import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_task/views/screens/screen_home_page.dart';
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
  runApp(MyApp());
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

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    checkNotificationPermission();
    super.initState();
  }

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    FirebaseMessaging.onMessage.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    print("message: $message");

    if (message.data['type'] == 'chat') {}
  }

  void setupNotificationChannel() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const settingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');
    final settingsIOS = DarwinInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) => null);
    await flutterLocalNotificationsPlugin.initialize(
        InitializationSettings(android: settingsAndroid, iOS: settingsIOS));

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      AppleNotification? iOS = message.notification?.apple;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    channelDescription: channel.description,
                    icon: android.smallIcon,
                    enableVibration: true,
                    // importance: Importance.max,
                    priority: Priority.max,
                    // ongoing: false,
                    // autoCancel: true,
                    // visibility: NotificationVisibility.public,
                    enableLights: true
                    // other properties...
                    ),
                iOS: DarwinNotificationDetails(
                  sound: iOS?.sound?.name,
                  presentAlert: true,
                  presentBadge: true,
                  presentSound: true,
                )));

        // showOngoingNotification(flutterLocalNotificationsPlugin, title: notification.title ?? "", body: notification.body ?? "");
      }
    });
  }

  void initNotificationChannel() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();
    const DarwinInitializationSettings initializationSettingsMacOS =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: initializationSettingsMacOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    // description
    importance: Importance.max,
  );

  void checkNotificationPermission() async {
    var settings = await FirebaseMessaging.instance.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      setupInteractedMessage();
      initNotificationChannel();
      setupNotificationChannel();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: FirebaseAuth.instance.currentUser==null?ScreenLogin():ScreenHomePage(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      title: "Flutter Task",
      theme: ThemeData(
        fontFamily: 'Montserrat',
        radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.all(appPrimaryColor)),
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
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat"),
          centerTitle: true,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: appPrimaryColor),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        dividerColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: appPrimaryColor).copyWith(background: Color(0xFFFAFBFF)),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobfind/app/authentication/login/login_view.dart';
import 'package:jobfind/app/home/home_view.dart';
import 'package:jobfind/app/splash/spalsh_view.dart';
import 'package:jobfind/services/FCM/fcm_configuration.dart';
import 'package:jobfind/services/notification/notifications_services.dart';

Future<void> main()async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FirebaseMessaging.instance.getInitialMessage();


  setupFlutterNotifications();
  await NotificationService().init();
  await NotificationService().requestIOSPermissions();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: GlobalVariable.navState,
      debugShowCheckedModeBanner: false,
      title: 'Job Portal',
      home:  TokenMonitor((val) {
          return SplashView();
        }
      ),
    );
  }
}


/// Global variables
/// * [GlobalKey<NavigatorState>]
class GlobalVariable {
  /// This global key is used in material app for navigation through firebase notifications.
  /// [navState] usage can be found in [notification_notifier.dart] file.
  static final GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();
}
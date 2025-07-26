// // ignore_for_file: depend_on_referenced_packages
// import 'dart:math';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_base_architecture/core/helpers/app_const.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import 'package:flutter_timezone/flutter_timezone.dart';

// import 'app_user_info.dart';

// class AppNotificationHelper {
//   //! for notification
//   static Future subscribeToTopic() async {
//     try {
//       int id = await AppUserInfo.getUserId();
//       final role = AppUserInfo.getUserRole();
//       //! All App
//       await FirebaseMessaging.instance.subscribeToTopic(
//         AppConst.notiTopic,
//       );
//       //! All Role
//       await FirebaseMessaging.instance.subscribeToTopic(
//         '${AppConst.notiTopic}.$role',
//       );
//       //! Specific Role
//       await FirebaseMessaging.instance.subscribeToTopic(
//         '${AppConst.notiTopic}.$role.$id',
//       );
//     } catch (e) {
//       return null;
//     }
//   }

//   static Future unsubscribeFromTopic() async {
//     try {
//       int id = await AppUserInfo.getUserId();
//       final role = AppUserInfo.getUserRole();
//       //! All App
//       await FirebaseMessaging.instance.unsubscribeFromTopic(
//         AppConst.notiTopic,
//       );
//       //! All Role
//       await FirebaseMessaging.instance.unsubscribeFromTopic(
//         '${AppConst.notiTopic}.$role',
//       );
//       //! Specific Role
//       await FirebaseMessaging.instance.unsubscribeFromTopic(
//         '${AppConst.notiTopic}.$role.$id',
//       );
//     } catch (e) {
//       return null;
//     }
//   }

//   static final FlutterLocalNotificationsPlugin fLNP =
//       FlutterLocalNotificationsPlugin();

//   static Future<void> initialise() async {
//     AndroidInitializationSettings initializationSettingsAndroid =
//         const AndroidInitializationSettings('app_icon');
//     const DarwinInitializationSettings initializationSettingsDarwin =
//         DarwinInitializationSettings();
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsDarwin,
//     );
//     fLNP.initialize(
//       initializationSettings,
//       onDidReceiveBackgroundNotificationResponse: onSelectNotification,
//       onDidReceiveNotificationResponse: onSelectNotification,
//     );
//     //!============================================================
//     tz.initializeTimeZones();
//     final localeName = await FlutterTimezone.getLocalTimezone();
//     tz.setLocalLocation(tz.getLocation(localeName));

//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//     } else {}
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       var noti = message.notification ?? const RemoteNotification();
//       showNotification(
//         message,
//         noti.title!,
//         noti.body!,
//         fLNP,
//       );
//     });

//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     FirebaseMessaging.onMessageOpenedApp.listen((message) {});
//   }

//   static onSelectNotification(NotificationResponse d) {}

//   static showNotification(
//     RemoteMessage remoteMessage,
//     String title,
//     String body,
//     FlutterLocalNotificationsPlugin fln,
//   ) async {
//     Random random = Random();
//     int id = random.nextInt(1000000);
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       "id_101",
//       "channel_101",
//       playSound: true,
//       importance: Importance.max,
//       priority: Priority.max,
//       icon: remoteMessage.notification?.android?.smallIcon,
//     );
//     //!===================================================
//     var iosNotificatonDetail = const DarwinNotificationDetails(
//       presentSound: true,
//     );
//     //!===================================================
//     NotificationDetails platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: iosNotificatonDetail,
//     );
//     await fln.show(
//       id,
//       title,
//       body,
//       platformChannelSpecifics,
//     );
//   }r

//   static Future<dynamic> onBackgroundMessage(
//     RemoteMessage message,
//   ) async {}
// }




// class PushNotificationsService {
//   static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

//   static Future<void> init() async {
//     try {
//       await _requestPermission();
//       await _initializeForegroundHandling();
//       await _initializeBackgroundHandling();
//       await _subscribeToDefaultTopic();
//       await _sendInitialToken();
//     } catch (e, stacktrace) {
//       log('PushNotification Init Error: $e', stackTrace: stacktrace);
//     }
//   }

//   static Future<void> _requestPermission() async {
//     final settings = await _messaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//       announcement: false,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: true, // Provisional => اشعارات صامتة لحد ما يوافق
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       log('User granted permission');
//     } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
//       log('User granted provisional permission');
//     } else {
//       log('User declined or has not accepted permission');
//     }
//   }

//   static Future<void> _sendInitialToken() async {
//     final token = await _messaging.getToken();
//     if (token != null) {
//       await _sendTokenToServer(token);
//     }
//     _messaging.onTokenRefresh.listen((newToken) async {
//       await _sendTokenToServer(newToken);
//     });
//   }

//   static Future<void> _sendTokenToServer(String token) async {
//     try {
//       log('Sending FCM Token to server: $token');
//       await ApiService.post(
//         Endpoints.saveFcmToken,
//         body: {
//           'token': token,
//         },
//       );
//     } catch (e) {
//       log('Failed to send token: $e');
//     }
//   }

//   static Future<void> _initializeForegroundHandling() async {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       if (message.notification != null) {
//         LocalNotificationService.showBasicNotification(message);
//       }
//     });
//   }

//   static Future<void> _initializeBackgroundHandling() async {
//     FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
//   }

//   static Future<void> _subscribeToDefaultTopic() async {
//     try {
//       await _messaging.subscribeToTopic('all');
//       log('Subscribed to topic: all');
//     } catch (e) {
//       log('Error subscribing to topic: $e');
//     }
//   }

//   static Future<void> unsubscribeFromDefaultTopic() async {
//     try {
//       await _messaging.unsubscribeFromTopic('all');
//       log('Unsubscribed from topic: all');
//     } catch (e) {
//       log('Error unsubscribing from topic: $e');
//     }
//   }

//   static Future<void> logout() async {
//     try {
//       await unsubscribeFromDefaultTopic();
//       await _messaging.deleteToken();
//       log('FCM token deleted');
//     } catch (e) {
//       log('Error during logout: $e');
//     }
//   }

//   static Future<void> _handleBackgroundMessage(RemoteMessage message) async {
//     await Firebase.initializeApp();
//     log('Handling a background message: ${message.messageId}');
//   }
// }






// class LocalNotificationService {
//   static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   static StreamController<NotificationResponse> streamController =
//       StreamController();
//   static onTap(NotificationResponse notificationResponse) {
//     // log(notificationResponse.id!.toString());
//     // log(notificationResponse.payload!.toString());
//     streamController.add(notificationResponse);
//     // Navigator.push(context, route);
//   }

//   static Future init() async {
//     InitializationSettings settings = const InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//       iOS: DarwinInitializationSettings(),
//     );
//     flutterLocalNotificationsPlugin.initialize(
//       settings,
//       onDidReceiveNotificationResponse: onTap,
//       onDidReceiveBackgroundNotificationResponse: onTap,
//     );
//   }

//   //basic Notification
//   static void showBasicNotification(RemoteMessage message) async {
//     final http.Response image = await http
//         .get(Uri.parse(message.notification?.android?.imageUrl ?? ''));
//     BigPictureStyleInformation bigPictureStyleInformation =
//         BigPictureStyleInformation(
//       ByteArrayAndroidBitmap.fromBase64String(
//         base64Encode(image.bodyBytes),
//       ),
//       largeIcon: ByteArrayAndroidBitmap.fromBase64String(
//         base64Encode(image.bodyBytes),
//       ),
//     );
//     AndroidNotificationDetails android = AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       importance: Importance.max,
//       priority: Priority.high,
//       styleInformation: bigPictureStyleInformation,
//       playSound: true,
//       sound: RawResourceAndroidNotificationSound(
//           'long_notification_sound'.split('.').first),
//     );
//     NotificationDetails details = NotificationDetails(
//       android: android,
//     );
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       message.notification?.title,
//       message.notification?.body,
//       details,
//     );
//   }
// }
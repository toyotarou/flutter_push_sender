import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'screens/home_screen.dart';
import 'firebase_options.dart';

///
//バックグラウンド/終了メッセージが呼び出す、最上位スコープの名前付きハンドラー
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

///
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // FCM の通知権限リクエスト(iOS用)
  final messaging = FirebaseMessaging.instance;

  await messaging.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);

  await messaging.requestPermission(
      alert: true, announcement: false, badge: true, carPlay: false, criticalAlert: false, provisional: false, sound: true);

  //------------------------- フォアグラウンドでメッセージを受け取った時のイベント
  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) {
      print("フォアグラウンドでメッセージを受け取りました");

      // flutter_local_notificationsプラグインの初期化
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      // android用の通知チャネルの設定
      const AndroidNotificationChannel channel =
          AndroidNotificationChannel('high_importance_channel', 'High Importance Notifications', importance: Importance.high);

      RemoteNotification? notification = message.notification;

      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        // flutter_local_notificationsプラグインを使って通知内容をUIに反映して目視できるようにする。
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            // Android 固有の通知の詳細
            android: AndroidNotificationDetails(channel.id, channel.name, icon: 'launch_background'),
          ),
        );
      }
    },
  );
  //------------------------- フォアグラウンドでメッセージを受け取った時のイベント

  //iOS用
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('A new onMessageOpenedApp event was published!');
  });

  // バックグラウンドでのメッセージ受信イベント
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

///
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ///
  @override
  Widget build(BuildContext context) => MaterialApp(home: HomeScreen());
}

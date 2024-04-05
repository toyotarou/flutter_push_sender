// ignore_for_file: must_be_immutable

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

///
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.32),
                child: TextFormField(controller: titleController, decoration: const InputDecoration(labelText: "通知タイトル")),
              ),
              Padding(
                padding: const EdgeInsets.all(16.32),
                child: TextFormField(controller: bodyController, decoration: const InputDecoration(labelText: "通知内容")),
              ),
              ElevatedButton(
                onPressed: () async {
                  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

                  await firebaseMessaging.subscribeToTopic('all-devices');

                  HttpsCallable sender = FirebaseFunctions.instanceFor(region: "asia-northeast1").httpsCallable('sendPushNotificationTopicCustom');

                  Map<String, String> pushMessageMap = {'title': titleController.text, 'body': bodyController.text};

                  await sender(pushMessageMap);

                  print('通知送信しました');
                },
                child: const Text('通知送信'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

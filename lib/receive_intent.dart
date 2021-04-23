import 'dart:async';

import 'package:flutter/services.dart';

class ReceivedIntent {
  final String? fromPackageName;
  final List<String>? fromSignatures;
  final String action;
  final String? data;
  final List<String>? categories;
  final Map<String, dynamic>? extra;

  const ReceivedIntent({
    this.fromPackageName,
    this.fromSignatures,
    required this.action,
    this.data,
    this.categories,
    this.extra,
  });

  factory ReceivedIntent.fromMap(Map? map) => ReceivedIntent(
        fromPackageName: map?["fromPackageName"],
        fromSignatures: map?["fromSignatures"],
        action: map?["action"],
        data: map?["data"],
        categories: map?["categories"],
        extra: (map?["extra"] as Map?)?.map<String, dynamic>(
            (key, value) => MapEntry(key.toString(), value)),
      );
}

class ReceiveIntent {
  static const MethodChannel _methodChannel =
      const MethodChannel('receive_intent');
  static const EventChannel _eventChannel =
      const EventChannel("receive_intent/event");

  static Future<ReceivedIntent?> getInitialIntent() async {
    final renameMap = await _methodChannel.invokeMapMethod('getInitialIntent');
    print("result: $renameMap");
    return ReceivedIntent.fromMap(renameMap);
  }

  static Stream<ReceivedIntent?> receivedIntentStream = _eventChannel
      .receiveBroadcastStream()
      .map<ReceivedIntent?>((event) => ReceivedIntent.fromMap(event as Map?));

  static Future<void> giveResult(int resultCode, {Map? data}) async {
    await _methodChannel.invokeMethod('giveResult',
        <String, dynamic>{"resultCode": resultCode, "data": data});
  }
}

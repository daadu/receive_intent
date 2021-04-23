import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

class ReceivedIntent {
  final bool isNull;
  final String? fromPackageName;
  final List<String>? fromSignatures;
  final String action;
  final String? data;
  final List<String>? categories;
  final Map<String, dynamic>? extra;

  bool get isNotNull => !isNull;

  const ReceivedIntent({
    this.isNull = true,
    this.fromPackageName,
    this.fromSignatures,
    required this.action,
    this.data,
    this.categories,
    this.extra,
  });

  factory ReceivedIntent.fromMap(Map? map) => ReceivedIntent(
        isNull: map == null,
        fromPackageName: map?["fromPackageName"],
        fromSignatures: map?["fromSignatures"] != null
            ? List.unmodifiable(
                (map!["fromSignatures"] as List).map((e) => e.toString()))
            : null,
        action: map?["action"],
        data: map?["data"],
        categories: map?["categories"] != null
            ? List.unmodifiable(
                (map!["categories"] as List).map((e) => e.toString()))
            : null,
        extra: map?["extra"] != null
            ? (json.decode(map!["extra"]) as Map)
                .map((key, value) => MapEntry(key.toString(), value))
            : null,
      );

  Map<String, dynamic> toMap() => {
        "fromPackageName": fromPackageName,
        "fromSignatures": fromSignatures,
        "action": action,
        "data": data,
        "categories": categories,
        "extra": extra,
      };
}

class ReceiveIntent {
  static const MethodChannel _methodChannel =
      const MethodChannel('receive_intent');
  static const EventChannel _eventChannel =
      const EventChannel("receive_intent/event");

  static Future<ReceivedIntent?> getInitialIntent() async {
    final renameMap = await _methodChannel.invokeMapMethod('getInitialIntent');
    //print("result: $renameMap");
    return ReceivedIntent.fromMap(renameMap);
  }

  static Stream<ReceivedIntent?> receivedIntentStream = _eventChannel
      .receiveBroadcastStream()
      .map<ReceivedIntent?>((event) => ReceivedIntent.fromMap(event as Map?));

  static Future<void> giveResult(int resultCode, {Map? data}) async {
    await _methodChannel.invokeMethod('giveResult', <String, dynamic>{
      "resultCode": resultCode,
      "data": json.encode(data),
    });
  }
}

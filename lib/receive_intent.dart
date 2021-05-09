import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

const kActivityResultOk = -1;
const kActivityResultCanceled = 0;

class Intent {
  final bool isNull;
  final String? fromPackageName;
  final List<String>? fromSignatures;
  final String action;
  final String? data;
  final List<String>? categories;
  final Map<String, dynamic>? extra;

  bool get isNotNull => !isNull;

  const Intent({
    this.isNull = true,
    this.fromPackageName,
    this.fromSignatures,
    required this.action,
    this.data,
    this.categories,
    this.extra,
  });

  factory Intent.fromMap(Map? map) => Intent(
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

  static Future<Intent?> getInitialIntent() async {
    final renameMap = await _methodChannel.invokeMapMethod('getInitialIntent');
    //print("result: $renameMap");
    return Intent.fromMap(renameMap);
  }

  static Stream<Intent?> receivedIntentStream = _eventChannel
      .receiveBroadcastStream()
      .map<Intent?>((event) => Intent.fromMap(event as Map?));

  static Future<void> setResult(int resultCode,
      {Map<String, dynamic?>? data, bool shouldFinish: false}) async {
    await _methodChannel.invokeMethod('setResult', <String, dynamic>{
      "resultCode": resultCode,
      if (data != null) "data": json.encode(data),
      "shouldFinish": shouldFinish,
    });
  }
}

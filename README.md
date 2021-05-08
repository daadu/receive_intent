# receive_intent

[![pub.dev](https://img.shields.io/pub/v/receive_intent?logo=dart)](https://pub.dev/packages/receive_intent)
[![analysis](https://github.com/daadu/receive_intent/workflows/analysis/badge.svg)](https://github.com/daadu/receive_intent/actions?query=workflow%3Aanalysis)
[![pub points](https://badges.bar/receive_intent/pub%20points)](https://pub.dev/packages/receive_intent/score)
[![popularity](https://badges.bar/receive_intent/popularity)](https://pub.dev/packages/receive_intent/score)
[![likes](https://badges.bar/receive_intent/likes)](https://pub.dev/packages/receive_intent/score)
[![GitHub issues](https://img.shields.io/github/issues/daadu/receive_intent?logo=github)](https://github.com/daadu/receive_intent/issues)
[![GitHub milestone](https://img.shields.io/github/milestones/progress-percent/daadu/receive_intent/1?logo=github)](https://github.com/daadu/receive_intent/milestone/1)
[![GitHub stars](https://img.shields.io/github/stars/daadu/receive_intent?logo=github)](https://github.com/daadu/receive_intent/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/daadu/receive_intent?logo=github)](https://github.com/daadu/receive_intent/network)

A Flutter plugin to pass Android Intents to the Flutter environment.

`Intent` in Android is the "payload" for the communication between and within apps. This plugin passes the `Intent`, that "started"  the `Activity` to the flutter environment. It also passes any "new Intents" that are received (via [`Activity.onNewIntent`](https://developer.android.com/reference/android/app/Activity#onNewIntent(android.content.Intent))) while the `Activity` is already "started".

If the `Intent` was "started" via `startActivityForResult`, then this plugin also sends additional information (package name and app signature) about the "calling" Android Component, and can send "result" back (via [`Activity.setResult`](https://developer.android.com/reference/android/app/Activity#setResult(int))) to it.

This plugin is in active development.
___Any contribution, idea, criticism or feedback is welcomed.___

## Quick links
| | |
|-|-|
| __package__ | https://pub.dev/packages/receive_intent |
| __Git Repo__  | https://github.com/daadu/receive_intent |
| __Issue Tracker__ | https://github.com/daadu/receive_intent/issues |


## Use cases
- [OAuth based App Flip](https://developers.google.com/identity/account-linking/app-flip-overview) - This was the initial motivation for this plugin. The plugin can be used to pass the `Intent` sent by Google App to the flutter environment - where the consent UI is shown - once it is authorized (or not), the result is sent back to the Google App.
- Deeplink/Applink - This plugin is a generic implementation of [uni_links](https://pub.dev/packages/uni_links) plugin. While this plugin passes "any" Intents, `uni_links` only passes app-link/deep-link Intents.
- Receive Share Intents - This plugin is a generic implementation of [receive_sharing_intent](https://pub.dev/packages/receive_sharing_intent) plugin. While this plugin passes "any" Intents, `receive_sharing_intent` only passes "android.intent.action.SEND" (or related) Intents.
- In general, if you want other apps to "start" your app, then this plugin can pass the `Intent` that "triggered" it to the flutter environment of the app. These `Intent` will give the app understanding of why the app was started. Check [Getting started](#getting-started) section to implement this.

## Getting started
TODO

## Todo
- Write [Getting started](#getting-started) section
- Document API references properly
- Receive Intent for non-`Activity` based `intent-filter` (`BroadcastReceiver`, `Service`)
- Automatic testing

## Contribute
Check the [Todo](#todo) section above, before you begin with any contribution.

1. You'll need a GitHub account.
2. Fork the [repository](https://github.com/daadu/receive_intent).
3. Pick an issue to work on from [issue tracker](https://github.com/daadu/receive_intent/issues).
4. Implement it.
5. Add your name and email in `authors` section in `pubspec.yaml` file.
6. Send merge request.
7. Star this project.
8. Become a hero!!

## Features and bugs
Please file feature requests and bugs at the [issue tracker](https://github.com/daadu/receive_intent/issues).

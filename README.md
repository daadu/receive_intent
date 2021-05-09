# receive_intent

<p>
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
<a href="#contributors-"><img src="https://img.shields.io/badge/all_contributors-1-orange.svg" alt="All Contributors" /></a>
<!-- ALL-CONTRIBUTORS-BADGE:END -->
<a href="https://pub.dev/packages/receive_intent"><img src="https://img.shields.io/pub/v/receive_intent?logo=dart" alt="pub.dev"></a>
<a href="https://github.com/daadu/receive_intent/actions?query=workflow%3Aanalysis"><img src="https://github.com/daadu/receive_intent/workflows/analysis/badge.svg" alt="analysis"></a>
<a href="https://pub.dev/packages/receive_intent/score"><img src="https://badges.bar/receive_intent/pub%20points" alt="pub points"></a>
<a href="https://pub.dev/packages/receive_intent/score"><img src="https://badges.bar/receive_intent/popularity" alt="popularity"></a>
<a href="https://pub.dev/packages/receive_intent/score"><img src="https://badges.bar/receive_intent/likes" alt="likes"></a>
<a href="https://github.com/daadu/receive_intent/issues"><img src="https://img.shields.io/github/issues/daadu/receive_intent?logo=github" alt="GitHub issues"></a>
<a href="https://github.com/daadu/receive_intent/milestone/1"><img src="https://img.shields.io/github/milestones/progress-percent/daadu/receive_intent/1?logo=github" alt="GitHub milestone"></a>
<a href="https://github.com/daadu/receive_intent/stargazers"><img src="https://img.shields.io/github/stars/daadu/receive_intent?logo=github" alt="GitHub stars"></a>
<a href="https://github.com/daadu/receive_intent/network"><img src="https://img.shields.io/github/forks/daadu/receive_intent?logo=github" alt="GitHub forks"></a></p>
</p>

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

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://bhikadia.com/"><img src="https://avatars.githubusercontent.com/u/4963236?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Harsh Bhikadia</b></sub></a><br /><a href="https://github.com/daadu/receive_intent/commits?author=daadu" title="Code">💻</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
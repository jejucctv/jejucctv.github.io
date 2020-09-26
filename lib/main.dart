import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sentry/sentry.dart';

import 'package:jejucctv/screens/dashboard/dashboard.dart';

final _sentry = SentryClient(
    dsn:
        "https://00d18c9b55524bc8ba27dcec62df36f7@o444501.ingest.sentry.io/5440463");

bool get isInDebugMode {
  // 기본적으로 프로덕션 모드라고 가정합니다.
  bool inDebugMode = false;

  // Assert 표현식은 개발 단계에서만 사용되며, 프로덕션 모드에서는 무시됩니다.
  // 그러므로 이 코드는 개발 단계에서만 'inDebugMode'를 true로 설정합니다.
  assert(inDebugMode = true);

  return inDebugMode;
}

const String _release =
    String.fromEnvironment('SENTRY_RELEASE', defaultValue: 'unknown');

Future<void> main() async {
  // Needs to move into the library
  FlutterError.onError = (FlutterErrorDetails details) async {
    print('Capture from FlutterError ${details.exception}');
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };

  if (!kIsWeb) {
    // Throws when running on the browser
    Isolate.current.addSentryErrorListener(_sentry);
  }

  runZonedGuarded<Future<void>>(() async {
    runApp(MyApp());
  }, (error, stackTrace) async {
    print('Capture from runZonedGuarded $error');
    final event = Event(
        exception: error,
        stackTrace: stackTrace,
        // release is required on Web to match the source maps
        release: _release);
    await _sentry.capture(event: event);
  });
}

// Candidate API for the SDK
extension IsolateExtensions on Isolate {
  void addSentryErrorListener(SentryClient sentry) {
    final receivePort = RawReceivePort((dynamic values) async {
      await sentry.captureIsolateError(values);
    });

    Isolate.current.addErrorListener(receivePort.sendPort);
  }
}

// Candidate API for the SDK
extension SentryExtensions on SentryClient {
  Future<void> captureIsolateError(dynamic error) {
    print('Capture from IsolateError $error');

    if (error is List<dynamic> && error.length != 2) {
      dynamic stackTrace = error[1];
      if (stackTrace != null) {
        stackTrace = StackTrace.fromString(stackTrace as String);
      }
      return captureException(exception: error[0], stackTrace: stackTrace);
    } else {
      return Future.value();
    }
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Map<String, WidgetBuilder> routes = {
    // '/': (BuildContext context) => Login(),
    // '/': (BuildContext context) => HomeScreen(),
    // };
    return MaterialApp(
      // initialRoute: '/',
      // routes: routes,
      theme: ThemeData(),
      debugShowCheckedModeBanner: true,
      title: '제주도 CCTV',
      home: Dashboard(),
    );
  }
}

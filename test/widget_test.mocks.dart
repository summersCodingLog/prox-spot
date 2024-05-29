// Mocks generated by Mockito 5.4.4 from annotations
// in prox_spot/test/widget_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:typed_data' as _i10;

import 'package:flutter_local_notifications/src/flutter_local_notifications_plugin.dart'
    as _i11;
import 'package:flutter_local_notifications/src/initialization_settings.dart'
    as _i12;
import 'package:flutter_local_notifications/src/notification_details.dart'
    as _i15;
import 'package:flutter_local_notifications/src/platform_specifics/ios/enums.dart'
    as _i17;
import 'package:flutter_local_notifications/src/typedefs.dart' as _i13;
import 'package:flutter_local_notifications/src/types.dart' as _i18;
import 'package:flutter_local_notifications_platform_interface/flutter_local_notifications_platform_interface.dart'
    as _i14;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart'
    as _i7;
import 'package:hive/hive.dart' as _i3;
import 'package:hive/src/box/default_compaction_strategy.dart' as _i9;
import 'package:hive/src/box/default_key_comparator.dart' as _i8;
import 'package:location/location.dart' as _i4;
import 'package:location_platform_interface/location_platform_interface.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:timezone/timezone.dart' as _i16;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeLocationData_0 extends _i1.SmartFake implements _i2.LocationData {
  _FakeLocationData_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBox_1<E1> extends _i1.SmartFake implements _i3.Box<E1> {
  _FakeBox_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLazyBox_2<E1> extends _i1.SmartFake implements _i3.LazyBox<E1> {
  _FakeLazyBox_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Location].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocation extends _i1.Mock implements _i4.Location {
  @override
  _i5.Stream<_i2.LocationData> get onLocationChanged => (super.noSuchMethod(
        Invocation.getter(#onLocationChanged),
        returnValue: _i5.Stream<_i2.LocationData>.empty(),
        returnValueForMissingStub: _i5.Stream<_i2.LocationData>.empty(),
      ) as _i5.Stream<_i2.LocationData>);

  @override
  _i5.Future<bool> changeSettings({
    _i2.LocationAccuracy? accuracy = _i2.LocationAccuracy.high,
    int? interval = 1000,
    double? distanceFilter = 0.0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #changeSettings,
          [],
          {
            #accuracy: accuracy,
            #interval: interval,
            #distanceFilter: distanceFilter,
          },
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> isBackgroundModeEnabled() => (super.noSuchMethod(
        Invocation.method(
          #isBackgroundModeEnabled,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> enableBackgroundMode({bool? enable = true}) =>
      (super.noSuchMethod(
        Invocation.method(
          #enableBackgroundMode,
          [],
          {#enable: enable},
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<_i2.LocationData> getLocation() => (super.noSuchMethod(
        Invocation.method(
          #getLocation,
          [],
        ),
        returnValue: _i5.Future<_i2.LocationData>.value(_FakeLocationData_0(
          this,
          Invocation.method(
            #getLocation,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.LocationData>.value(_FakeLocationData_0(
          this,
          Invocation.method(
            #getLocation,
            [],
          ),
        )),
      ) as _i5.Future<_i2.LocationData>);

  @override
  _i5.Future<_i2.PermissionStatus> hasPermission() => (super.noSuchMethod(
        Invocation.method(
          #hasPermission,
          [],
        ),
        returnValue: _i5.Future<_i2.PermissionStatus>.value(
            _i2.PermissionStatus.granted),
        returnValueForMissingStub: _i5.Future<_i2.PermissionStatus>.value(
            _i2.PermissionStatus.granted),
      ) as _i5.Future<_i2.PermissionStatus>);

  @override
  _i5.Future<_i2.PermissionStatus> requestPermission() => (super.noSuchMethod(
        Invocation.method(
          #requestPermission,
          [],
        ),
        returnValue: _i5.Future<_i2.PermissionStatus>.value(
            _i2.PermissionStatus.granted),
        returnValueForMissingStub: _i5.Future<_i2.PermissionStatus>.value(
            _i2.PermissionStatus.granted),
      ) as _i5.Future<_i2.PermissionStatus>);

  @override
  _i5.Future<bool> serviceEnabled() => (super.noSuchMethod(
        Invocation.method(
          #serviceEnabled,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> requestService() => (super.noSuchMethod(
        Invocation.method(
          #requestService,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<_i2.AndroidNotificationData?> changeNotificationOptions({
    String? channelName,
    String? title,
    String? iconName,
    String? subtitle,
    String? description,
    dynamic color,
    bool? onTapBringToFront,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #changeNotificationOptions,
          [],
          {
            #channelName: channelName,
            #title: title,
            #iconName: iconName,
            #subtitle: subtitle,
            #description: description,
            #color: color,
            #onTapBringToFront: onTapBringToFront,
          },
        ),
        returnValue: _i5.Future<_i2.AndroidNotificationData?>.value(),
        returnValueForMissingStub:
            _i5.Future<_i2.AndroidNotificationData?>.value(),
      ) as _i5.Future<_i2.AndroidNotificationData?>);
}

/// A class which mocks [GoogleSignIn].
///
/// See the documentation for Mockito's code generation for more information.
class MockGoogleSignIn extends _i1.Mock implements _i6.GoogleSignIn {
  @override
  _i7.SignInOption get signInOption => (super.noSuchMethod(
        Invocation.getter(#signInOption),
        returnValue: _i7.SignInOption.standard,
        returnValueForMissingStub: _i7.SignInOption.standard,
      ) as _i7.SignInOption);

  @override
  List<String> get scopes => (super.noSuchMethod(
        Invocation.getter(#scopes),
        returnValue: <String>[],
        returnValueForMissingStub: <String>[],
      ) as List<String>);

  @override
  bool get forceCodeForRefreshToken => (super.noSuchMethod(
        Invocation.getter(#forceCodeForRefreshToken),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i5.Stream<_i6.GoogleSignInAccount?> get onCurrentUserChanged =>
      (super.noSuchMethod(
        Invocation.getter(#onCurrentUserChanged),
        returnValue: _i5.Stream<_i6.GoogleSignInAccount?>.empty(),
        returnValueForMissingStub: _i5.Stream<_i6.GoogleSignInAccount?>.empty(),
      ) as _i5.Stream<_i6.GoogleSignInAccount?>);

  @override
  _i5.Future<_i6.GoogleSignInAccount?> signInSilently({
    bool? suppressErrors = true,
    bool? reAuthenticate = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInSilently,
          [],
          {
            #suppressErrors: suppressErrors,
            #reAuthenticate: reAuthenticate,
          },
        ),
        returnValue: _i5.Future<_i6.GoogleSignInAccount?>.value(),
        returnValueForMissingStub: _i5.Future<_i6.GoogleSignInAccount?>.value(),
      ) as _i5.Future<_i6.GoogleSignInAccount?>);

  @override
  _i5.Future<bool> isSignedIn() => (super.noSuchMethod(
        Invocation.method(
          #isSignedIn,
          [],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<_i6.GoogleSignInAccount?> signIn() => (super.noSuchMethod(
        Invocation.method(
          #signIn,
          [],
        ),
        returnValue: _i5.Future<_i6.GoogleSignInAccount?>.value(),
        returnValueForMissingStub: _i5.Future<_i6.GoogleSignInAccount?>.value(),
      ) as _i5.Future<_i6.GoogleSignInAccount?>);

  @override
  _i5.Future<_i6.GoogleSignInAccount?> signOut() => (super.noSuchMethod(
        Invocation.method(
          #signOut,
          [],
        ),
        returnValue: _i5.Future<_i6.GoogleSignInAccount?>.value(),
        returnValueForMissingStub: _i5.Future<_i6.GoogleSignInAccount?>.value(),
      ) as _i5.Future<_i6.GoogleSignInAccount?>);

  @override
  _i5.Future<_i6.GoogleSignInAccount?> disconnect() => (super.noSuchMethod(
        Invocation.method(
          #disconnect,
          [],
        ),
        returnValue: _i5.Future<_i6.GoogleSignInAccount?>.value(),
        returnValueForMissingStub: _i5.Future<_i6.GoogleSignInAccount?>.value(),
      ) as _i5.Future<_i6.GoogleSignInAccount?>);

  @override
  _i5.Future<bool> requestScopes(List<String>? scopes) => (super.noSuchMethod(
        Invocation.method(
          #requestScopes,
          [scopes],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}

/// A class which mocks [HiveInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockHiveInterface extends _i1.Mock implements _i3.HiveInterface {
  @override
  void init(
    String? path, {
    _i3.HiveStorageBackendPreference? backendPreference =
        _i3.HiveStorageBackendPreference.native,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #init,
          [path],
          {#backendPreference: backendPreference},
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<_i3.Box<E>> openBox<E>(
    String? name, {
    _i3.HiveCipher? encryptionCipher,
    _i3.KeyComparator? keyComparator = _i8.defaultKeyComparator,
    _i3.CompactionStrategy? compactionStrategy = _i9.defaultCompactionStrategy,
    bool? crashRecovery = true,
    String? path,
    _i10.Uint8List? bytes,
    String? collection,
    List<int>? encryptionKey,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #openBox,
          [name],
          {
            #encryptionCipher: encryptionCipher,
            #keyComparator: keyComparator,
            #compactionStrategy: compactionStrategy,
            #crashRecovery: crashRecovery,
            #path: path,
            #bytes: bytes,
            #collection: collection,
            #encryptionKey: encryptionKey,
          },
        ),
        returnValue: _i5.Future<_i3.Box<E>>.value(_FakeBox_1<E>(
          this,
          Invocation.method(
            #openBox,
            [name],
            {
              #encryptionCipher: encryptionCipher,
              #keyComparator: keyComparator,
              #compactionStrategy: compactionStrategy,
              #crashRecovery: crashRecovery,
              #path: path,
              #bytes: bytes,
              #collection: collection,
              #encryptionKey: encryptionKey,
            },
          ),
        )),
        returnValueForMissingStub: _i5.Future<_i3.Box<E>>.value(_FakeBox_1<E>(
          this,
          Invocation.method(
            #openBox,
            [name],
            {
              #encryptionCipher: encryptionCipher,
              #keyComparator: keyComparator,
              #compactionStrategy: compactionStrategy,
              #crashRecovery: crashRecovery,
              #path: path,
              #bytes: bytes,
              #collection: collection,
              #encryptionKey: encryptionKey,
            },
          ),
        )),
      ) as _i5.Future<_i3.Box<E>>);

  @override
  _i5.Future<_i3.LazyBox<E>> openLazyBox<E>(
    String? name, {
    _i3.HiveCipher? encryptionCipher,
    _i3.KeyComparator? keyComparator = _i8.defaultKeyComparator,
    _i3.CompactionStrategy? compactionStrategy = _i9.defaultCompactionStrategy,
    bool? crashRecovery = true,
    String? path,
    String? collection,
    List<int>? encryptionKey,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #openLazyBox,
          [name],
          {
            #encryptionCipher: encryptionCipher,
            #keyComparator: keyComparator,
            #compactionStrategy: compactionStrategy,
            #crashRecovery: crashRecovery,
            #path: path,
            #collection: collection,
            #encryptionKey: encryptionKey,
          },
        ),
        returnValue: _i5.Future<_i3.LazyBox<E>>.value(_FakeLazyBox_2<E>(
          this,
          Invocation.method(
            #openLazyBox,
            [name],
            {
              #encryptionCipher: encryptionCipher,
              #keyComparator: keyComparator,
              #compactionStrategy: compactionStrategy,
              #crashRecovery: crashRecovery,
              #path: path,
              #collection: collection,
              #encryptionKey: encryptionKey,
            },
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.LazyBox<E>>.value(_FakeLazyBox_2<E>(
          this,
          Invocation.method(
            #openLazyBox,
            [name],
            {
              #encryptionCipher: encryptionCipher,
              #keyComparator: keyComparator,
              #compactionStrategy: compactionStrategy,
              #crashRecovery: crashRecovery,
              #path: path,
              #collection: collection,
              #encryptionKey: encryptionKey,
            },
          ),
        )),
      ) as _i5.Future<_i3.LazyBox<E>>);

  @override
  _i3.Box<E> box<E>(String? name) => (super.noSuchMethod(
        Invocation.method(
          #box,
          [name],
        ),
        returnValue: _FakeBox_1<E>(
          this,
          Invocation.method(
            #box,
            [name],
          ),
        ),
        returnValueForMissingStub: _FakeBox_1<E>(
          this,
          Invocation.method(
            #box,
            [name],
          ),
        ),
      ) as _i3.Box<E>);

  @override
  _i3.LazyBox<E> lazyBox<E>(String? name) => (super.noSuchMethod(
        Invocation.method(
          #lazyBox,
          [name],
        ),
        returnValue: _FakeLazyBox_2<E>(
          this,
          Invocation.method(
            #lazyBox,
            [name],
          ),
        ),
        returnValueForMissingStub: _FakeLazyBox_2<E>(
          this,
          Invocation.method(
            #lazyBox,
            [name],
          ),
        ),
      ) as _i3.LazyBox<E>);

  @override
  bool isBoxOpen(String? name) => (super.noSuchMethod(
        Invocation.method(
          #isBoxOpen,
          [name],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i5.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteBoxFromDisk(
    String? name, {
    String? path,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteBoxFromDisk,
          [name],
          {#path: path},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteFromDisk() => (super.noSuchMethod(
        Invocation.method(
          #deleteFromDisk,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  List<int> generateSecureKey() => (super.noSuchMethod(
        Invocation.method(
          #generateSecureKey,
          [],
        ),
        returnValue: <int>[],
        returnValueForMissingStub: <int>[],
      ) as List<int>);

  @override
  _i5.Future<bool> boxExists(
    String? name, {
    String? path,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #boxExists,
          [name],
          {#path: path},
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  void resetAdapters() => super.noSuchMethod(
        Invocation.method(
          #resetAdapters,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void registerAdapter<T>(
    _i3.TypeAdapter<T>? adapter, {
    bool? internal = false,
    bool? override = false,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerAdapter,
          [adapter],
          {
            #internal: internal,
            #override: override,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool isAdapterRegistered(int? typeId) => (super.noSuchMethod(
        Invocation.method(
          #isAdapterRegistered,
          [typeId],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  void ignoreTypeId<T>(int? typeId) => super.noSuchMethod(
        Invocation.method(
          #ignoreTypeId,
          [typeId],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [FlutterLocalNotificationsPlugin].
///
/// See the documentation for Mockito's code generation for more information.
class MockFlutterLocalNotificationsPlugin extends _i1.Mock
    implements _i11.FlutterLocalNotificationsPlugin {
  @override
  _i5.Future<bool?> initialize(
    _i12.InitializationSettings? initializationSettings, {
    _i13.SelectNotificationCallback? onSelectNotification,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #initialize,
          [initializationSettings],
          {#onSelectNotification: onSelectNotification},
        ),
        returnValue: _i5.Future<bool?>.value(),
        returnValueForMissingStub: _i5.Future<bool?>.value(),
      ) as _i5.Future<bool?>);

  @override
  _i5.Future<_i14.NotificationAppLaunchDetails?>
      getNotificationAppLaunchDetails() => (super.noSuchMethod(
            Invocation.method(
              #getNotificationAppLaunchDetails,
              [],
            ),
            returnValue: _i5.Future<_i14.NotificationAppLaunchDetails?>.value(),
            returnValueForMissingStub:
                _i5.Future<_i14.NotificationAppLaunchDetails?>.value(),
          ) as _i5.Future<_i14.NotificationAppLaunchDetails?>);

  @override
  _i5.Future<void> show(
    int? id,
    String? title,
    String? body,
    _i15.NotificationDetails? notificationDetails, {
    String? payload,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #show,
          [
            id,
            title,
            body,
            notificationDetails,
          ],
          {#payload: payload},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> cancel(
    int? id, {
    String? tag,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #cancel,
          [id],
          {#tag: tag},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> cancelAll() => (super.noSuchMethod(
        Invocation.method(
          #cancelAll,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> schedule(
    int? id,
    String? title,
    String? body,
    DateTime? scheduledDate,
    _i15.NotificationDetails? notificationDetails, {
    String? payload,
    bool? androidAllowWhileIdle = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #schedule,
          [
            id,
            title,
            body,
            scheduledDate,
            notificationDetails,
          ],
          {
            #payload: payload,
            #androidAllowWhileIdle: androidAllowWhileIdle,
          },
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> zonedSchedule(
    int? id,
    String? title,
    String? body,
    _i16.TZDateTime? scheduledDate,
    _i15.NotificationDetails? notificationDetails, {
    required _i17.UILocalNotificationDateInterpretation?
        uiLocalNotificationDateInterpretation,
    required bool? androidAllowWhileIdle,
    String? payload,
    _i18.DateTimeComponents? matchDateTimeComponents,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #zonedSchedule,
          [
            id,
            title,
            body,
            scheduledDate,
            notificationDetails,
          ],
          {
            #uiLocalNotificationDateInterpretation:
                uiLocalNotificationDateInterpretation,
            #androidAllowWhileIdle: androidAllowWhileIdle,
            #payload: payload,
            #matchDateTimeComponents: matchDateTimeComponents,
          },
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> periodicallyShow(
    int? id,
    String? title,
    String? body,
    _i14.RepeatInterval? repeatInterval,
    _i15.NotificationDetails? notificationDetails, {
    String? payload,
    bool? androidAllowWhileIdle = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #periodicallyShow,
          [
            id,
            title,
            body,
            repeatInterval,
            notificationDetails,
          ],
          {
            #payload: payload,
            #androidAllowWhileIdle: androidAllowWhileIdle,
          },
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> showDailyAtTime(
    int? id,
    String? title,
    String? body,
    _i18.Time? notificationTime,
    _i15.NotificationDetails? notificationDetails, {
    String? payload,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDailyAtTime,
          [
            id,
            title,
            body,
            notificationTime,
            notificationDetails,
          ],
          {#payload: payload},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> showWeeklyAtDayAndTime(
    int? id,
    String? title,
    String? body,
    _i18.Day? day,
    _i18.Time? notificationTime,
    _i15.NotificationDetails? notificationDetails, {
    String? payload,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showWeeklyAtDayAndTime,
          [
            id,
            title,
            body,
            day,
            notificationTime,
            notificationDetails,
          ],
          {#payload: payload},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<List<_i14.PendingNotificationRequest>>
      pendingNotificationRequests() => (super.noSuchMethod(
            Invocation.method(
              #pendingNotificationRequests,
              [],
            ),
            returnValue:
                _i5.Future<List<_i14.PendingNotificationRequest>>.value(
                    <_i14.PendingNotificationRequest>[]),
            returnValueForMissingStub:
                _i5.Future<List<_i14.PendingNotificationRequest>>.value(
                    <_i14.PendingNotificationRequest>[]),
          ) as _i5.Future<List<_i14.PendingNotificationRequest>>);
}

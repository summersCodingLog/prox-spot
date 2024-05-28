// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mockito/annotations.dart';

import 'package:prox_spot/main.dart';
import 'package:prox_spot/model/favorite_point.dart';

import 'package:prox_spot/pages/add_favorite_page.dart';
import 'package:prox_spot/pages/edit_favorite_page.dart';
import 'package:prox_spot/pages/favorite_list_page.dart';
import 'package:prox_spot/pages/map_page.dart';
import 'package:prox_spot/pages/set_distance_page.dart';
import 'package:prox_spot/pages/home_page.dart';
import 'package:prox_spot/utils/hive_ext.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:prox_spot/service/location_service.dart';


import 'widget_test.mocks.dart';

extension MyAppTesting on GoogleLoginButton {
  static GoogleSignIn googleSignIn = GoogleSignIn();
}


@GenerateNiceMocks([MockSpec<GoogleSignIn>()])
@GenerateNiceMocks([MockSpec<HiveInterface>()])

void main() {
  setUpAll(() async {
    // Mocking the getApplicationDocumentsDirectory method from path_provider
    const MethodChannel('plugins.flutter.io/path_provider')
        .setMockMethodCallHandler((methodCall) async {
      if (methodCall.method == 'getApplicationDocumentsDirectory') {
        final directory = Directory.systemTemp.createTempSync();
        return directory.path;
      }
      return null;
    });

    //Initialize Hive for test environment
    await Hive.initFlutter();
    MockHiveInterface mockHive = MockHiveInterface();
    // Open a dummy box for testing
    await Hive.openBox('app_login');
  });


  testWidgets('MyApp displays GoogleLoginButton when not logged in', (
      WidgetTester tester) async {
    await tester.runAsync(() async {
      final mockGoogleSignIn = MockGoogleSignIn();
      when(mockGoogleSignIn.signIn()).thenAnswer((_) =>
          Future.value("text" as FutureOr<GoogleSignInAccount?>?));

      // Setting up the widget
      await tester.pumpWidget(MyApp(toHome: false));

      // Verifying GoogleLoginButton is displayed
      expect(find.byType(GoogleLoginButton), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsNothing);
      // Tapping the button
      await tester.tap(find.byType(GoogleLoginButton));
      await tester.pumpAndSettle();

      // Verifying navigation
      expect(find.text('Sign in  with Google'), findsNothing);
    });
  });

  testWidgets('MyApp goes to homepage when user is already logged in', (
      WidgetTester tester) async {
    await Hive.initFlutter();
    MockHiveInterface mockHive = MockHiveInterface();

    // Call the method under test
    await mockHive.openBox;
    String login = "test";
    mockHive.putLoginEmail(login);
    mockHive.initUserHive(login);

    // Setting up the widget
    await tester.pumpWidget(const MyApp(toHome: true));


    // Verifying GoogleLoginButton is not displayed
    expect(find.byType(GoogleLoginButton), findsNothing);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.map_outlined), findsOneWidget);
  });


  testWidgets(
      'HomePage UI clicking on favorites page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: HomePage(),
    ));

    // Verify that the HomePage widget has been rendered
    expect(find.byType(HomePage), findsOneWidget);

    // Verify that the MapPage is the initial page
    expect(find.byType(MapPage), findsOneWidget);
    expect(find.byType(FavoriteListPage), findsNothing);

    // Tap on the second bottom navigation bar item
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();

    // Verify that the FavoriteListPage is displayed after tapping the second bottom navigation bar item
    expect(find.byType(MapPage), findsNothing);
    expect(find.byType(FavoriteListPage), findsOneWidget);
  });


  testWidgets('SetDistancePage UI Test: testing arrow back', (
      WidgetTester tester) async {
    // Build our SetDistancePage widget.
    await tester.pumpWidget(MaterialApp(home: SetDistancePage()));

    // Verify if the title is displayed.
    expect(find.text('set distance'), findsOneWidget);

    // Verify if the back button is present.
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);

    // Tap on the back button and verify if it triggers navigation.
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    // After popping, the SetDistancePage should be gone
    expect(find.text('set distance'), findsNothing);
  });


  testWidgets('SetDistancePage UI Test: submitting a distance and saving', (
      WidgetTester tester) async {
    Hive.initFlutter();
    Hive.openBox('distance');
    //when(Hive.putDistance(100)).thenReturn(100 as Future<void>);
    // build the widget to test the TextField.
    await tester.pumpWidget(MaterialApp(home: SetDistancePage()));

    // Verify if the TextField for entering distance is present.
    expect(find.byType(TextFormField), findsOneWidget);

    // Enter text into the TextFormField and verify the entered text.
    await tester.enterText(find.byType(TextFormField), '100');
    expect(find.text('100'), findsOneWidget);

    // Verify if the SAVE button is present.
    expect(find.text('SAVE'), findsOneWidget);

    // Tap on the save button and verify if it triggers a snackbar.
    //await tester.tap(find.text('SAVE'));
    //await tester.pump();
    //expect(find.text('distance set success!'), findsOneWidget);
  });
}




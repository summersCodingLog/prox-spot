// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prox_spot/main.dart';
import 'package:prox_spot/pages/add_location_form.dart';
import 'package:prox_spot/pages/edit_favorite_page.dart';
import 'package:prox_spot/pages/favorite_list_page.dart';
import 'package:prox_spot/pages/home_page.dart';
import 'package:prox_spot/pages/location_item.dart';
import 'package:prox_spot/pages/location_list.dart';
import 'package:prox_spot/pages/map_page.dart';

void main() {
  testWidgets('Find Widgets', (WidgetTester tester) async {

    await tester.pumpWidget(MyApp());

    expect(find.byIcon(Icons.login), findsOneWidget);


    await tester.pumpWidget(const FavoriteListPage());

    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.text('Favorite Locations'), findsOneWidget);

  });
}
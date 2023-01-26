import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/home_screen.dart';

void main() {
  group("Home screen widget Test", () {
    testWidgets("testing if Listview show up", (tester) async {
      //init widget createhomescreen to background task
      await tester.pumpWidget(createHomeScreen());

      //hope if open homescreen listview is available or finded
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets("Testing scrolling", (tester) async {
      // pump widget for present above it in the widget tree so it can inherit from them and get access to the data they offer.
      await tester.pumpWidget(createHomeScreen());

      //find one item with text item 0
      expect(find.text("Item 0"), findsOneWidget);

      //create animation scrolling listview with offset 0 s/d -200 and speed 3000
      await tester.fling(find.byType(ListView), const Offset(0, -200), 3000);

      await tester.pumpAndSettle();

      //hope item with text Item 0 nothing
      expect(find.text("Item 0"), findsNothing);
    });

    testWidgets("Testing IconButtons", (tester) async {
      // pump widget for present above it in the widget tree so it can inherit from them and get access to the data they offer.
      await tester.pumpWidget(createHomeScreen());

      //find icon favorite on homescreen with expect nothing
      expect(find.byIcon(Icons.favorite), findsNothing);

      //find icon favorite border first and tap it
      await tester.tap(find.byIcon(Icons.favorite_border).first);

      //settle it with 1 second duration
      await tester.pumpAndSettle(const Duration(seconds: 1));

      //find text 'added to favorites.' on the home screen
      expect(find.text("Added to favorites."), findsOneWidget);

      //find icon favorite on homescreen with expect widget available
      expect(find.byIcon(Icons.favorite), findsWidgets);

      //find icon favorite first and tap it
      await tester.tap(find.byIcon(Icons.favorite).first);

      //settle it with 1 second duration
      await tester.pumpAndSettle(const Duration(seconds: 1));

      //find text 'Removed from favorites.' on the home screen
      expect(find.text("Removed from favorites."), findsOneWidget);

      //find icon favorite on homescreen with expect nothing
      expect(find.byIcon(Icons.favorite), findsNothing);
    });
  });
}

//create an app that loads the widget to be tested in a MaterialApp wrapped into a ChangeNotifierProvider
Widget createHomeScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );

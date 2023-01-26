import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/Favorites_screen.dart';

void main() {
  group("Favorites screen widget Test", () {
    testWidgets("testing if Listview show up", (tester) async {
      //init widget createhomescreen to background task
      await tester.pumpWidget(createFavoritesScreen());

      //add item
      addItems();

      await tester.pumpAndSettle();

      //hope if open homescreen listview is available or finded
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets("Testing remove button", (tester) async {
      const testKey = Key('1');

      // pump widget for present above it in the widget tree so it can inherit from them and get access to the data they offer.
      await tester.pumpWidget(createFavoritesScreen());

      //add item
      addItems();

      await tester.pumpAndSettle();

      //count item with icon close in this screen
      var totalItems = tester.widgetList(find.byIcon(Icons.close)).length;

      //trigger tap item first with icon close
      await tester.tap(find.byIcon(Icons.close).first);

      await tester.pumpAndSettle();

      //hope the result is count all item with icon close is less then all item before tap
      expect(tester.widgetList(find.byIcon(Icons.close)).length,
          lessThan(totalItems));

      //hope the result is show text 'Removed from favorites.'
      expect(find.text('Removed from favorites.'), findsOneWidget);
    });
  });
}

late Favorites favoritesList;

void addItems() {
  for (var i = 0; i < 10; i += 2) {
    favoritesList.add(i);
  }
}

//create an app that loads the widget to be tested in a MaterialApp wrapped into a ChangeNotifierProvider
Widget createFavoritesScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) {
        favoritesList = Favorites();
        return favoritesList;
      },
      child: const MaterialApp(
        home: FavoritesScreen(),
      ),
    );

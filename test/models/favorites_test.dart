import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/models/favorites.dart';

void main() {
  //create a test group name
  group("Testing app provider", () {
    //call models favorite from lib/models/favorites
    var favorites = Favorites();

    //create a test method to add items
    test("a new item should be added", () {
      //create a variable number with contents 35
      var number = 35;

      //add variable number to models favorites
      favorites.add(number);

      //check expect whether in favorites models there are numbers or number 35
      expect(favorites.items.contains(number), true);
    });

    //create a test method to delete the item
    test("a item should be removed", () {
      //create a variable number with contents 35
      var number = 45;

      //add variable number to models favorites
      favorites.add(number);

      //check expect whether in models favorites there are numbers or number 45 should be there or true
      expect(favorites.items.contains(number), true);

      //remove the item number from the favorites list
      favorites.remove(number);

      //check expect whether in the models favorites there are numbers or the number 45 should not exist or be false
      expect(favorites.items.contains(number), false);
    });
  });
}

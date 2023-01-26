import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorites.dart';
import 'widgets/favorite_item_tile.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<Favorites>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.items.length,
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) => FavoriteItemTile(
            key: Key(index.toString()),
            itemNo: value.items[index],
          ),
        ),
      ),
    );
  }
}

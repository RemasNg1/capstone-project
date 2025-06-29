import 'package:final_project/screens/client/category_services/category_services_screen.dart';
import 'package:final_project/screens/client/favorites/favorite_screen.dart';
import 'package:flutter/material.dart';

class Totesthome extends StatelessWidget {
  const Totesthome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CategoryServiceScreen(categoryName: 'Venues'),
                  ),
                );
              },
              child: Text("go to catogray"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoriteScreen()),
                );
              },
              child: Text("Favorite"),
            ),
          ],
        ),
      ),
    );
  }
}

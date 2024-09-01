import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Favorite Items',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorite Item 1'),
              onTap: () {
                // Show details of the favorite item
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorite Item 2'),
              onTap: () {
                // Show details of the favorite item
              },
            ),
          ],
        ),
      ),
    );
  }
}

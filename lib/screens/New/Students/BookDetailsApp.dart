import 'package:flutter/material.dart';
class BookDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookDetailsPage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class BookDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                'https://covers.openlibrary.org/b/id/8225261-L.jpg',
                height: 200,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '1984',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                for (var i = 0; i < 5; i++)
                  Icon(
                    i < 4 ? Icons.star : Icons.star_half,
                    color: Colors.amber,
                  ),
                SizedBox(width: 8.0),
                Text('4.5/5.0'),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Description',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Lorem ipsum dolor sit amet consectetur. Sed elit orci ullamcorper purus at vel sit mattis vulputate. Justo dapibus viverra sit felis nibh dignissim. Nulla tortor sed amet ultrices sed nunc faucibus est ipsum. Varius enim in massa posuere varius egestas.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Author',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with your author's image URL
                ),
                SizedBox(width: 8.0),
                Text(
                  'Francis Wintheiser',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Read The Book'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0), backgroundColor: Colors.purple,
                  textStyle: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
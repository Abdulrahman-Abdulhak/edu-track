import 'package:flutter/material.dart';


class EliteScholarsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EliteScholarsPage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class EliteScholarsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Elite Scholars Academy'),
            Text(
              'esa@edu-track.com',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        leading: CircleAvatar(
          child: Text('ES'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            SectionHeader(title: 'Continue Reading', onViewMore: () {}),
            SizedBox(height: 8.0),
            HorizontalList(items: [
              BookItem(title: 'To Kill a Mockingbird', author: 'Harper Lee', imageUrl: 'https://via.placeholder.com/100x150'),
              BookItem(title: 'The Catcher in the Rye', author: 'J.D. Salinger', imageUrl: 'https://via.placeholder.com/100x150'),
              BookItem(title: 'The Hate U Give', author: 'Angie Thomas', imageUrl: 'https://via.placeholder.com/100x150'),
            ]),
            SizedBox(height: 16.0),
            SectionHeader(title: 'Top Books', onViewMore: () {}),
            SizedBox(height: 8.0),
            HorizontalList(items: [
              BookItem(title: '1984', author: 'George Orwell', imageUrl: 'https://via.placeholder.com/100x150'),
              BookItem(title: 'The Book Thief', author: 'Markus Zusak', imageUrl: 'https://via.placeholder.com/100x150'),
              BookItem(title: 'The Perks of Being a Wallflower', author: 'Stephen Chbosky', imageUrl: 'https://via.placeholder.com/100x150'),
            ]),
            SizedBox(height: 16.0),
            SectionHeader(title: 'Articles', onViewMore: () {}),
            SizedBox(height: 8.0),
            HorizontalList(items: [
              ArticleItem(title: 'The Great Martian Bake-Off', author: 'Alex Starling'),
              ArticleItem(title: 'The Secret Life of Trees', author: 'Dr. Willow Green'),
              ArticleItem(title: 'Time-Traveling Teens', author: 'Jamie Clarke'),
            ]),
            SizedBox(height: 16.0),
            SectionHeader(title: 'Useful Projects', onViewMore: () {}),
            SizedBox(height: 8.0),
            HorizontalList(items: [
              ProjectItem(title: 'Eco-Warriors', author: 'Green Future Initiative'),
              ProjectItem(title: 'Tech Titans', author: 'Future Innovators'),
              ProjectItem(title: 'Cultural Kaleidoscope', author: 'Global Harmony'),
            ]),
            SizedBox(height: 16.0),
            SectionHeader(title: 'Useful Programs', onViewMore: () {}),
            SizedBox(height: 8.0),
            HorizontalList(items: [
              ProgramItem(title: 'Koha', imageUrl: 'https://via.placeholder.com/100x100'),
              ProgramItem(title: 'OverDrive', imageUrl: 'https://via.placeholder.com/100x100'),
              ProgramItem(title: 'EverGreen', imageUrl: 'https://via.placeholder.com/100x100'),
            ]),
          ],
        ),
      ),
    );
  }
}


class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onViewMore;

  SectionHeader({required this.title, required this.onViewMore});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onViewMore,
          child: Text('View More'),
        ),
      ],
    );
  }
}

class HorizontalList extends StatelessWidget {
  final List<Widget> items;

  HorizontalList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: items,
      ),
    );
  }
}

class BookItem extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;

  BookItem({required this.title, required this.author, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      margin: EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: 100.0,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            author,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class ArticleItem extends StatelessWidget {
  final String title;
  final String author;

  ArticleItem({required this.title, required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      margin: EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30.0,
            child: Text(
              title[0],
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            author,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  final String title;
  final String author;

  ProjectItem({required this.title, required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      margin: EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30.0,
            child: Text(
              author[0],
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            author,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class ProgramItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProgramItem({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 100.0,
      margin: EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
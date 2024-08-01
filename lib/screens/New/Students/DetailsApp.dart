import 'package:flutter/material.dart';


class DetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DetailsPage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
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
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    image: NetworkImage('https://via.placeholder.com/400x200'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                    size: 64.0,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Python Programming for Beginners.\nBasic rules in 5 hours',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Text('6 Lessons', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 16.0),
                  Text('2 Tests', style: TextStyle(color: Colors.grey)),
                  Spacer(),
                  Text('\$10', style: TextStyle(color: Colors.purple, fontSize: 18.0, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Egestas augue proin eget nec orci libero. Nunc egestas suscipit nulla feugiat ipsum. '
                    'Commodo metus fringilla est molestie sit pharetra pellentesque purus. Donec magna nunc '
                    'porta commodo eu feugiat ac.',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 16.0),
              TabBarSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarSection extends StatefulWidget {
  @override
  _TabBarSectionState createState() => _TabBarSectionState();
}

class _TabBarSectionState extends State<TabBarSection> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      TabBar(
      controller: _tabController,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.purple,
      tabs: [
        Tab(text: 'Lessons'),
        Tab(text: 'Tasks'),
      ],
    ),
    SizedBox(
    height: 300.0,
    child: TabBarView(
    controller: _tabController,
    children: [ListView(
      children: [
        LessonItem(title: 'What is Programming', duration: '15:00 min'),
        LessonItem(title: 'Write Your First Program', duration: '30:00 min'),
        LessonItem(title: 'Basic of Programming', duration: '50:00 min'),
        LessonItem(title: 'Arrays in Python', duration: '35:00 min'),
        LessonItem(title: 'OOP', duration: '40:00 min'),
        LessonItem(title: 'Final Project', duration: '10:00 min'),
      ],
    ),
      Center(child: Text('No tasks available')),
    ],
    ),
    ),
      ],
    );
  }
}

class LessonItem extends StatelessWidget {
  final String title;
  final String duration;

  LessonItem({required this.title, required this.duration});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.play_circle_fill, color: Colors.purple),
      title: Text(title),
      subtitle: Text(duration),
    );
  }
}
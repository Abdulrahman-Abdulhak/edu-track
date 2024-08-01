import 'package:flutter/material.dart';

class DetailsA extends StatelessWidget {
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
                'What is Programming',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'About Lesson',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              SizedBox(height: 8.0),
              Text(
                'Egestas augue proin eget nec orci libero. Nunc egestas suscipit nulla feugiat ipsum. '
                    'Commodo metus fringilla est molestie sit pharetra pellentesque purus. Donec magna nunc '
                    'porta commodo eu feugiat ac.',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 16.0),
              Text(
                'Tasks',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              TaskItem(title: 'First Task', description: '5 Questions'),
              SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0), backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  child: Text(
                    'Next Lesson',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  final String title;
  final String description;

  TaskItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.task, color: Colors.purple),
      title: Text(title),
      subtitle: Text(description),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      tileColor: Colors.grey[200],
      contentPadding: EdgeInsets.all(16.0),
    );
  }
}
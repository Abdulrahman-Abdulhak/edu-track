
import 'package:flutter/material.dart';


class ExamResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundColor: Colors.purple.shade100,
          child: Text('ES', style: TextStyle(color: Colors.purple)),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Elite Scholars Academy', style: TextStyle(fontSize: 16)),
            Text('esa@edu-track.com', style: TextStyle(fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_list),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Exams & Results', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('3 Subjects', style: TextStyle(color: Colors.purple)),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: Text('Name', style: TextStyle(color: Colors.grey))),
                Expanded(child: Text('Exam', style: TextStyle(color: Colors.grey))),
                Expanded(child: Text('Action', style: TextStyle(color: Colors.grey))),
              ],
            ),
            Divider(),
            Expanded(
              child: ListView(
                children: [
                  ExamResultTile('بنيان2', 'Final Exam'),
                  ExamResultTile('ghaith', 'Final Exam'),
                  ExamResultTile('abo ahmed', 'Final Exam'),
                  ExamResultTile('abo khaled', 'Final Exam'),
                  ExamResultTile('am  khaled', 'Final Exam'),
                  ExamResultTile('am ahmed', 'Final Exam'),
                  ExamResultTile('Mhd Hamada', 'Final Exam'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}

class ExamResultTile extends StatelessWidget {
  final String studentName;
  final String examType;

  ExamResultTile(this.studentName, this.examType);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              title: Text(studentName),
              subtitle: Text(examType),
            ),
          ),
          Expanded(
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: Text('View Exam', style: TextStyle(color: Colors.purple)),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: TextButton(
                onPressed: () {},
                child: Text('Correct', style: TextStyle(color: Colors.purple)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



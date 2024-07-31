
import 'package:flutter/material.dart';



class ExamResultsApp extends StatelessWidget {
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
          backgroundImage: AssetImage('.png'),
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
                Expanded(child: Text('Status', style: TextStyle(color: Colors.grey))),
              ],
            ),
            Divider(),
            Expanded(
              child: ListView(
                children: [
                  ExamResultTile('Programming', '@pr.p2', 'ghaith obari N.', 'Final Exam'),
                  ExamResultTile('Programming', '@pr.p1', 'abd alrahman Mhd', 'Final Exam'),
                  ExamResultTile('Programming', '@pr.p3', 'Mhd moner', 'Final Exam'),
                  ExamResultTile('Programming', '@pr.p3', 'Mhd reham', 'Final Exam'),
                  ExamResultTile('Programming', '@pr.p3', 'Mhd Hamada', 'Final Exam'),
                  ExamResultTile('Programming', '@pr.p3', 'Mhd Hamada', 'Final Exam'),
                  ExamResultTile('Programming', '@pr.p3', 'Mhd Hamada', 'Final Exam'),
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
  final String courseName;
  final String courseCode;
  final String studentName;
  final String examType;

  ExamResultTile(this.courseName, this.courseCode, this.studentName, this.examType);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple.shade100,
                child: Icon(Icons.arrow_forward, color: Colors.purple),
              ),
              title: Text(courseName),
              subtitle: Text(courseCode),
            ),
          ),
          Expanded(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple.shade100,
                child: Text(studentName.substring(0, 2), style: TextStyle(color: Colors.purple)),
              ),
              title: Text(studentName),
              subtitle: Text(examType),
            ),
          ),
        ],
      ),
    );
  }
}

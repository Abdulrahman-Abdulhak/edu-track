import 'package:flutter/material.dart';

class HomeworkSubmission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeworkPage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class HomeworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Elite Scholars Academy', style: TextStyle(fontSize: 18)),
            Text('esa@edu-track.com', style: TextStyle(fontSize: 14)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.school, color: Colors.red),
              title: Text('Computer Science/P1'),
            ),
            Divider(),
            ListTile(
              title: Text('Task 11 - P11.Pdf'),
              trailing:
                  Text('Monday 2024', style: TextStyle(color: Colors.grey)),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Icon(Icons.insert_drive_file, color: Colors.purple),
                title: Text('Assignment1.Pdf'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('200 KB'),
                    Text('Prof. Mohamad Hamda'),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text('Submission Status',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              title: Text('Submission status'),
              trailing: Chip(
                label: Text('Attempted', style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Grading Status'),
              trailing: Chip(
                label:
                    Text('Not Graded', style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.grey,
              ),
            ),
            ListTile(
              title: Text('Due date'),
              trailing: Text('Saturday, 1 June 2024, 12:00 AM',
                  style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              title: Text('Time remaining'),
              trailing: Text('Saturday, 20 June 2024, 12:00 AM',
                  style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              title: Text('Last modified'),
              trailing: Text('—', style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              title: Text('Upload Submission',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Icon(Icons.insert_drive_file, color: Colors.purple),
                title: Text('Sara_Math1_P11.PDF'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Correct'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('View'),
                ),
              ],
            ),
            ListTile(
              title: Text('Submission Comment',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text('SN'),
                ),
                title: Text('Sara N.'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('there is another solution in last page 😁.'),
                    Text('Sunday, 14 June 2024, 5:37 PM',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text('Reply'),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.assignment),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

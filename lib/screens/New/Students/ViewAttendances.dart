import 'package:flutter/material.dart';


class ViewAttendances extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AttendancePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class AttendancePage extends StatelessWidget {
  final List<Student> students = [
    Student(name: 'Mhd Hamada', status: 'Present'),
    Student(name: 'Mhd Hamada', status: 'Sick'),
    Student(name: 'Mhd Hamada', status: 'Not Checked'),
    Student(name: 'Mhd Hamada', status: 'Present'),
    Student(name: 'Mhd Hamada', status: 'Present'),
    Student(name: 'Mhd Hamada', status: 'Present'),
    Student(name: 'Mhd Hamada', status: 'Present'),
    Student(name: 'Mhd Hamada', status: 'Present'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Elite Scholars Academy', style: TextStyle(fontSize: 16.0)),
            Text('esa@edu-track.com', style: TextStyle(fontSize: 14.0)),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Attendance',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  '23 Students',
                  style: TextStyle(
                    color: Colors.purple,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return _buildStudentRow(students[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentRow(Student student) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.purple,
        child: Text(
          student.name.split(' ').map((e) => e[0]).take(2).join(),
          style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text(student.name),
      subtitle: Text('Final Exam'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(student.status),
          if (student.status == 'Present')
            Icon(Icons.check_box, color: Colors.purple),
          if (student.status == 'Sick')
            Icon(Icons.sick, color: Colors.orange),
          if (student.status == 'Not Checked')
            Icon(Icons.check_box_outline_blank, color: Colors.grey),
        ],
      ),
    );
  }
}

class Student {
  final String name;
  final String status;

  Student({required this.name, required this.status});
}

import 'package:flutter/material.dart';




class AllHomeworkSubmit extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
home: HomePage(),
theme: ThemeData(
primarySwatch: Colors.purple,
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
child: Text(
'ES',
style: TextStyle(color: Colors.purple),
),
),
title: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'Elite Scholars Academy',
style: TextStyle(fontSize: 16),
),
Text(
'esa@edu-track.com',
style: TextStyle(fontSize: 12),
),
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
child: ListView(
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
HomeworkSection(
sectionTitle: 'Computer Science/P1',
tasks: [
HomeworkTask(
title: 'Task 11 - P11.Pdf',
studentName: 'Mohamad Hamda',
dueDate: 'Due, Nov 11, 2024, 11PM',
status: 'Correct Homework',
statusColor: Colors.purple,
),
HomeworkTask(
title: 'Task 10 - P10.Pdf',
studentName: 'Ahmed Mhd',
dueDate: '',
status: '50/50',
statusColor: Colors.green,
),
],
),
HomeworkSection(
sectionTitle: 'Computer Science/P2',
tasks: [
HomeworkTask(
title: 'Task 11 - P11.Pdf',
studentName: 'Mohamad Hamda',
dueDate: 'Due, Nov 11, 2024, 11PM',
status: 'Correct Homework',
statusColor: Colors.purple,
),
HomeworkTask(
title: 'Task 10 - P10.Pdf',
studentName: 'Ahmed Mhd',
dueDate: '',
status: '50/50',
statusColor: Colors.green,
),
],
),
HomeworkSection(
sectionTitle: 'Computer Science/P3',
tasks: [
HomeworkTask(
title: 'Task 11 - P11.Pdf',
studentName: 'Mohamad Hamda',
dueDate: 'Due, Nov 11, 2024, 11PM',
status: 'Correct Homework',
statusColor: Colors.purple,
),
HomeworkTask(
title: 'Task 10 - P10.Pdf',
studentName: 'Ahmed Mhd',
dueDate: '',
status: '50/50',
statusColor: Colors.green,
),
],
),
SizedBox(height: 16),


  ElevatedButton(
    onPressed: () {
      // هون منربط ان شاءالله بس تقتنع
    },
    child: Text('Add a New Homework'),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.purple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 16.0),
    ),
  ),
],
),
),
  bottomNavigationBar: BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.assignment),
        label: 'Tasks',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ],
    selectedItemColor: Colors.purple,
  ),
);
}
}

class HomeworkSection extends StatelessWidget {
  final String sectionTitle;
  final List<HomeworkTask> tasks;

  HomeworkSection({required this.sectionTitle, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Icon(Icons.book, color: Colors.purple),
          title: Text(sectionTitle, style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Text('View All', style: TextStyle(color: Colors.purple)),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return tasks[index];
            },
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class HomeworkTask extends StatelessWidget {
  final String title;
  final String studentName;
  final String dueDate;
  final String status;
  final Color statusColor;

  HomeworkTask({
    required this.title,
    required this.studentName,
    required this.dueDate,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.calendar_today, color: Colors.grey),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 8),
          Text(studentName, style: TextStyle(color: Colors.grey)),
          if (dueDate.isNotEmpty) ...[
            SizedBox(height: 8),
            Text(dueDate, style: TextStyle(color: Colors.grey)),
          ],
          Spacer(),
          Row(
            children: [
              Text(status, style: TextStyle(color: statusColor)),
              Spacer(),
              Icon(Icons.arrow_forward, color: statusColor),
            ],
          ),
        ],
      ),
    );
  }
}

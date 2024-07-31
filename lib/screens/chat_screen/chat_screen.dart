import 'package:flutter/material.dart';


class Chat extends StatelessWidget {
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
backgroundImage: AssetImage(''),
),
title: Text('EduTrack'),
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
crossAxisAlignment: CrossAxisAlignment.start,
children: [
TextField(
decoration: InputDecoration(
hintText: 'Search',
prefixIcon: Icon(Icons.search),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(16.0),
),
),
),
SizedBox(height: 16),
Text('Active Now', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
SizedBox(height: 16),
Container(
height: 80,
child: ListView(
scrollDirection: Axis.horizontal,
children: [
ActiveUserAvatar('.png'),
ActiveUserAvatar('.png'),
ActiveUserAvatar('.png'),
ActiveUserAvatar('.png'),
],
),
),
SizedBox(height: 16),
Text('Recent Message', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
SizedBox(height: 16),
Expanded(
child: ListView(
children: [
MessageTile('', 'Olivia Rhye', 'LQP Organization', 'Student', '2'),
MessageTile('', 'Group 11 - Programing', 'LQP Organization', '', ''),
MessageTile('', 'Johnny Johan', 'LQP Organization', 'Student', ''),
MessageTile('', 'Phoenix B.', 'LQP Organization', 'Teacher', ''),
MessageTile('', 'Andi Lane', 'NOP Organization', 'Manager', ''),
MessageTile('', 'Natalia Postman', 'NOP Organization', 'Parent', ''),
MessageTile('.png', 'Malia B.', 'NOP Organization', 'Student', ''),
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

class ActiveUserAvatar extends StatelessWidget {
final String imagePath;

ActiveUserAvatar(this.imagePath);

@override
Widget build(BuildContext context) {
return Padding(
padding: const EdgeInsets.symmetric(horizontal: 8.0),
child: Stack(children: [
  CircleAvatar(
    radius: 30,
    backgroundImage: AssetImage(imagePath),
  ),
  Positioned(
    bottom: 0,
    right: 0,
    child: CircleAvatar(
      radius: 8,
      backgroundColor: Colors.green,
    ),
  ),
],
),
);
}
}

class MessageTile extends StatelessWidget {
  final String imagePath;
  final String name;
  final String organization;
  final String role;
  final String notificationCount;

  MessageTile(this.imagePath, this.name, this.organization, this.role, this.notificationCount);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(name),
      subtitle: Row(
        children: [
          Text('$organization ', style: TextStyle(color: Colors.purple)),
          if (role.isNotEmpty)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(role, style: TextStyle(color: Colors.blue)),
            ),
        ],
      ),
      trailing: notificationCount.isNotEmpty
          ? CircleAvatar(
        radius: 10,
        backgroundColor: Colors.purple,
        child: Text(notificationCount, style: TextStyle(color: Colors.white, fontSize: 12)),
      )
          : null,
    );
  }
}



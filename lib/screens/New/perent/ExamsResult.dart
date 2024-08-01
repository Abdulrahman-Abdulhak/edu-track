import 'package:flutter/material.dart';



class ExamsResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Text(
              "ES",
              style: TextStyle(color: Colors.white),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Elite Scholars Academy",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "esa@edu-track.com",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.filter_list),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Exams & Results",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "5 Subjects",
                    style: TextStyle(color: Colors.purple),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    _buildSubjectCard(
                      "Chemistry",
                      "@chemy.p1",
                      "Success",
                      "92/100",
                      Colors.orange,
                      Colors.green,
                    ),
                    _buildSubjectCard(
                      "Mathematics",
                      "@math.p1",
                      "Success",
                      "85/100",
                      Colors.green,
                      Colors.green,
                    ),
                    _buildSubjectCard(
                      "Programming",
                      "@pr.p1",
                      "Success",
                      "56/100",
                      Colors.purple,
                      Colors.green,
                    ),
                    _buildSubjectCard(
                      "French",
                      "@french.p1",
                      "Failed",
                      "40/100",
                      Colors.pink,
                      Colors.red,
                    ),
                    _buildSubjectCard(
                      "Sciences",
                      "@science.p1",
                      "Not Graded",
                      "--/--",
                      Colors.blue,
                      Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: [
            BottomNavigationBarItem(
backgroundColor: Colors.blue,
            icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.message),
        label: 'Messages',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_today),
        label: 'Calendar',
      ),
      BottomNavigationBarItem(
        icon: CircleAvatar(
          backgroundImage: NetworkImage('hom/150'),
        ),
        label: 'Profile',
      ),
      ],
    ),
    ),
    );
  }

  Widget _buildSubjectCard(
      String name,
      String handle,
      String status,
      String marks,
      Color iconColor,
      Color statusColor,
      ) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.2),
          child: Text(
            name[0],
            style: TextStyle(color: iconColor),
          ),
        ),
        title: Text(name),
        subtitle: Text(handle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: TextStyle(color: statusColor),
              ),
            ),
            SizedBox(width: 10),
            Text(marks),
          ],
        ),
      ),
    );
  }
}
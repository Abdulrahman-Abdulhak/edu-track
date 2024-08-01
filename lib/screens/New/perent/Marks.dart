import 'package:flutter/material.dart';


class Marks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: CircleAvatar(
            backgroundColor: Colors.purple.shade100,
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
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Status", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Marks", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Details", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    _buildSubjectRow("Success", "92/100", "View Marks", Colors.green, Icons.check),
                    _buildSubjectRow("Success", "85/100", "View Marks", Colors.green, Icons.check),
                    _buildSubjectRow("Success", "56/100", "View Marks", Colors.green, Icons.check),
                    _buildSubjectRow("Failed", "40/100", "View Marks", Colors.red, Icons.close),
                    _buildSubjectRow("Not Graded", "--", "View Marks", Colors.grey, null),
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
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectRow(
      String status, String marks, String buttonText, Color color, IconData? icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              SizedBox(width: 5),
              Text(
                status,
                style: TextStyle(color: color),
              ),
            ],
          ),
          Text(marks),
          TextButton(
            onPressed: () {},
            child: Text(buttonText, style: TextStyle(color: Colors.purple)),
          ),
        ],
      ),
    );
  }
}
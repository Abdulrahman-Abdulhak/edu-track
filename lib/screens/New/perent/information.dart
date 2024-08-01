
import 'package:flutter/material.dart';



class information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Text("ET", style: TextStyle(color: Colors.white)),
          ),
          title: Text("EduTrack"),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Welcome back, Mohamed",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Organize, monitor, and stay on top of your children.",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                _buildInfoCard("Courses of Ahmed", "17", "+3 vs last section", Icons.show_chart, Colors.green),
                _buildInfoCard("GPA of Ahmed", "2.32", "-5% vs last term", Icons.trending_down, Colors.red),
                _buildInfoCard("Courses Completed by Ahmed", "20", "+5 added to total", Icons.show_chart, Colors.green),
                SizedBox(height: 20),
                Text(
                  "Full Month Attendance",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                _buildAttendanceGrid(),
                SizedBox(height: 20),
                _buildUpcomingCoursesSection(),
                SizedBox(height: 20),
                _buildLatestMarksUpdatedSection(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, String subtitle, IconData icon, Color iconColor) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(icon, color: iconColor),
          ],
        ),
      ),
    );
  }
  Widget _buildAttendanceGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildAttendanceCard("Total Classes", "17", Colors.purple),
        _buildAttendanceCard("Holidays", "2", Colors.orange),
        _buildAttendanceCard("Total Present", "24", Colors.green),
        _buildAttendanceCard("Total Absent", "5", Colors.red),
      ],
    );
  }

  Widget _buildAttendanceCard(String title, String count, Color color) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Container(
        padding: EdgeInsets.all(15),
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              count,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingCoursesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Upcoming Courses",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text("View All"),
            ),
          ],
        ),
        SizedBox(height: 10),
        _buildCourseCard("Computer Science", "Atoms & Space: Elements & Compound", "Today, 7:00PM (30min left)"),
        _buildCourseCard("Computer Science", "Atoms & Space: Elements & Compound", "Today, 8:00PM (1hr left)"),
      ],
    );
  }

  Widget _buildCourseCard(String course, String title, String time) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(Icons.book, color: Colors.red),
        title: Text(course),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey),
                SizedBox(width: 5),
                Text(time),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLatestMarksUpdatedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Latest Marks Updated",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: _buildMarkCard("Task 2 (Team Task) Implementation of ...", "95/100")),
            SizedBox(width: 10),
            Expanded(child: _buildMarkCard("Task 5 (Team Task) Implementation of ...", "45/100")),
          ],
        ),
      ],
    );
  }

  Widget _buildMarkCard(String title, String mark) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text("Number Theory, Prime Numbers and Cryptography"),
        trailing: Text(
          mark,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: mark.contains("95") ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
  }
}
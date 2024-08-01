import 'package:flutter/material.dart';


class Attendances extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Attendanceses(),
    );
  }
}

class Attendanceses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            Text(
              "esa@edu-track.com",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "May 2024",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  InfoCard(
                    title: "Attendances",
                    count: 24,
                    percentage: "40%",
                    isIncrease: true,
                    graphColor: Colors.green,
                  ),
                  InfoCard(
                    title: "Absences",
                    count: 5,
                    percentage: "10%",
                    isIncrease: false,
                    graphColor: Colors.red,
                  ),
                  InfoCard(
                    title: "Leaves",
                    count: 8,
                    percentage: "5%",
                    isIncrease: false,
                    graphColor: Colors.orange,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Attendance Percentage",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.purple,
                      child: Text(
                        "85.62%",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      StatCard(
                        title: "Total Classes",
                        count: 17,
                        color: Colors.purple,
                      ),

                      StatCard(
                        title: "Holidays",
                        count: 2,
                        color: Colors.orange,
                      ),
                      StatCard(
                        title: "Total Present",
                        count: 24,
                        color: Colors.green,
                      ),
                      StatCard(
                        title: "Total Absent",
                        count: 5,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final int count;
  final String percentage;
  final bool isIncrease;
  final Color graphColor;

  InfoCard({
    required this.title,
    required this.count,
    required this.percentage,
    required this.isIncrease,
    required this.graphColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$count",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  isIncrease ? Icons.arrow_upward : Icons.arrow_downward,
                  color: isIncrease ? Colors.green : Colors.red,
                  size: 16,
                ),
                SizedBox(width: 4),
                Text(
                  "$percentage vs last season",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 40,
              color: graphColor.withOpacity(0.1),
              child: CustomPaint(
                painter: GraphPainter(color: graphColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GraphPainter extends CustomPainter {
  final Color color;

  GraphPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.5,
      size.width * 0.5,
      size.height * 0.75,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height,
      size.width,
      size.height * 0.5,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final int count;
  final Color color;

  StatCard({required this.title, required this.count, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
          Text(
          "$count",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        ],
      ),
    ),
    );
  }
}
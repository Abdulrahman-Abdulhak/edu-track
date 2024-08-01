import 'package:flutter/material.dart';


class Achievements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AchievementsPage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class AchievementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Elite Scholars Academy'),
            Text(
              'esa@edu-track.com',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        leading: CircleAvatar(
          child: Text('ES'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Achievements',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: 'Computer Sciences',
              icon: Icon(Icons.arrow_drop_down),
              isExpanded: true,
              items: <String>['Computer Sciences', 'Mathematics', 'Physics']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
            SizedBox(height: 16.0),
            AchievementCard(
              title: 'Full Python Course Zero to Hero',
              subtitle: 'You Completed Full With a Great Marks',
              progress: 1.0, // 100% progress
              buttonText: 'Download The Certificate',
              buttonAction: () {},
            ),
            SizedBox(height: 16.0),
            AchievementCard(
              title: 'Full Java Backend Course Zero to Hero',
              subtitle: 'Complete The Course to Get The Certificate',
              progress: 0.7, // 70% progress
              buttonText: 'Complete The Course',
              buttonAction: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class AchievementCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double progress;
  final String buttonText;
  final VoidCallback buttonAction;

  AchievementCard({
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.buttonText,
    required this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.emoji_events, color: Colors.grey),
                SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(subtitle),

                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
            ),
            SizedBox(height: 8.0),
            Text('${(progress * 100).toInt()}%'),
            SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: buttonAction,
                child: Text(buttonText),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
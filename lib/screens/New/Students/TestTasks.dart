import 'package:flutter/material.dart';



class TestTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestTaskPage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class TestTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Task'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
          },
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
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: 0.1, // 10% progress
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                  ),
                ),
                SizedBox(width: 8.0),
                Text('10%'),
              ],
            ),
            SizedBox(height: 8.0),
            Text('Time left: 15:00'),
            SizedBox(height: 32.0),
            Text(
              'What is Programming',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            OptionCard(optionText: 'The process of creating a set of instructions that tell a computer how to perform a task'),
            OptionCard(optionText: 'A method of preparing food'),
            OptionCard(optionText: 'A type of physical exercise'),
            OptionCard(optionText: 'A technique for painting'),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Next Question'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0), backgroundColor: Colors.purple,
                  textStyle: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final String optionText;

  OptionCard({required this.optionText});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          optionText,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
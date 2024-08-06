import 'package:flutter/material.dart';

//TODO: DELETE.

class Chat_ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Phoenix B.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Chip(
                      label: Text('LQP'),
                      backgroundColor: Colors.purple.shade100,
                    ),
                    SizedBox(width: 4),
                    Chip(
                      label: Text('Teacher'),
                      backgroundColor: Colors.pink.shade100,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                _buildReceivedMessage(
                  context,
                  'Phoenix Baker',
                  'Hey Sara, can you please review the latest design when you can?',
                  'Friday 2:20pm',
                ),
                _buildSentMessage(
                  context,
                  'Sure thing, I’ll have a look today.',
                  'Friday 2:20pm',
                ),
                _buildSentFileMessage(
                  context,
                  'Tech design requirements.pdf',
                  '200 KB',
                  'Friday 2:20pm',
                ),
                _buildReactionMessage(
                  context,
                  Icons.favorite,
                  Colors.red,
                ),
                _buildReceivedMessageWithFile(
                  context,
                  'Phoenix Baker',
                  'Can you please review the latest design when you can?',
                  '1.2 MB',
                  'Friday 2:22pm',
                ),
                _buildReactionMessage(
                  context,
                  Icons.local_fire_department,
                  Colors.orange,
                ),
                _buildSentMessage(
                  context,
                  'Yeah, Sure.',
                  'Friday 2:22pm',
                ),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildReceivedMessage(
      BuildContext context, String sender, String message, String time) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.png'),
              ),
              SizedBox(width: 8),
              Text(sender),
              Spacer(),
              Text(time),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 8),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(message),
          ),
        ],
      ),
    );
  }

  Widget _buildSentMessage(BuildContext context, String message, String time) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time),
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 8),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSentFileMessage(
      BuildContext context, String fileName, String fileSize, String time) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time),
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 8),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.insert_drive_file, color: Colors.purple),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fileName),
                    Text(fileSize),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReceivedMessageWithFile(BuildContext context, String sender,
      String message, String fileSize, String time) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.png'),
              ),
              SizedBox(width: 8),
              Text(sender),
              Spacer(),
              Text(time),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 8),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.image, color: Colors.purple),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(message),
                    Text(fileSize),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReactionMessage(
      BuildContext context, IconData icon, Color color) {
    return Align(
      alignment: Alignment.centerRight,
      child: Icon(
        icon,
        color: color,
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.send, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

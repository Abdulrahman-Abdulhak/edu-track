import 'package:flutter/material.dart';

class EduTrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EduTrackPage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class EduTrackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EduTrack'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildMonthHeader(),
            SizedBox(height: 16.0),
            _buildDatePicker(),
            SizedBox(height: 16.0),
            _buildSearchBar(),
            SizedBox(height: 16.0),
            _buildClassList(),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'August',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('+ Add Task'),
        ),
      ],
    );
  }

  Widget _buildDatePicker() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(7, (index) {
            return Column(
              children: [
                Text(
                  ['S', 'M', 'T', 'W', 'T', 'F', 'S'][index],
                  style: TextStyle(
                    color: index == 3 ? Colors.purple : Colors.grey,
                    fontWeight: index == 3 ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                SizedBox(height: 4.0),
                CircleAvatar(
                  radius: 16.0,
                  backgroundColor: index == 3 ? Colors.purple : Colors.transparent,
                  child: Text(
                    '${21 + index}',
                    style: TextStyle(
                      color: index == 3 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.filter_list),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildClassList() {
    return Expanded(
      child: ListView(
        children: [
          _buildClassItem(
            time: '5:10 PM',
            icon: Icons.code,
            title: 'C# and Cloud Computing: Integrating ...',
            date: 'Today, 5:10 PM (30min left)',
            organization: 'LQP Organization',
          ),
          _buildClassItem(
            time: '7:30 PM',
            icon: Icons.code_off,
            title: 'React and Material-UI: Building Bea...',
            date: 'Today, 7:30 PM (1hr & 20min left)',
            organization: 'LQP Organization',
          ),
          _buildClassItem(
            time: '8:45 PM',
            icon: Icons.code,
            title: 'C# and Cloud Computing: Integrating ...',
            date: 'Today, 8:45 PM (2hr & 30min left)',
            organization: 'LQP Organization',
          ),
          _buildClassItem(
            time: '11:45 PM',
            icon: Icons.code_off,
            title: 'React and Material-UI: Building Bea...',
            date: 'Today, 11:45 PM (3hr & 30min left)',
            organization: 'LQP Organization',
          ),
        ],
      ),
    );
  }


  Widget _buildClassItem({
    required String time,
    required IconData icon,
    required String title,
    required String date,
    required String organization,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date),
            Text(organization),
          ],
        ),
        trailing: Icon(icon, color: Colors.purple),
      ),
    );
  }
}
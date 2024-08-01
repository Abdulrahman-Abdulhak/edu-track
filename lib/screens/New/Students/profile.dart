import 'package:flutter/material.dart';


class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EduTrack'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('asset'),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Sara N.',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  Text('sara.2023@edu-track.com'),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('View Profile'),
                  ),
                ],
              ),
            ),
            Divider(),
            _buildSectionTitle('Personal Info'),
            _buildTextField('First name', 'Sara'),
            _buildTextField('Last name', 'N.'),
            _buildTextField('Email', 'sara.2023@edu-track.com'),
            _buildTextField('Phone', '+489 98 7654321'),
            _buildGenderSelection(),
            _buildBirthdayPicker(),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Cancel'),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Save changes'),
                ),
              ],
            ),
            Divider(),
            _buildSectionTitle('Profile'),
            _buildTextField('Enter Your Social Network', 'Ahmmeda1976'),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {},
              child: Text('Add'),
            ),
            Divider(),
            _buildSectionTitle('Bio'),
            _buildBioField(),
            _buildDropdownField('Country', 'Syria'),
            _buildDropdownField('Timezone', 'Damascus UTC +03:00'),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Cancel'),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Save changes'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),


      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text('Gender:'),
          SizedBox(width: 16.0),
          _buildGenderRadio('Male'),
          _buildGenderRadio('Female'),
          _buildGenderRadio('Other'),
        ],
      ),
    );
  }

  Widget _buildGenderRadio(String gender) {
    return Row(
      children: [
        Radio(
          value: gender,
          groupValue: 'Female',
          onChanged: (value) {},
        ),
        Text(gender),
      ],
    );
  }

  Widget _buildBirthdayPicker() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Birthday'),
          SizedBox(height: 8.0),
          Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.purple),
              SizedBox(width: 8.0),
              Text('2002 August 21'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBioField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        maxLines: 5,
        initialValue:
        'I\'m a Product Designer based in Melbourne, Australia. I specialize in UX/UI design, brand strategy, and Webflow development.',
        decoration: InputDecoration(
          labelText: 'Bio',
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, String initialValue) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: initialValue,
        items: <String>['Syria', 'USA', 'UK', 'Australia']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newValue) {},
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
    );
  }
}
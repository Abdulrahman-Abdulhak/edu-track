import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'package:edu_track/core/core.dart';
import 'package:edu_track/models/models.dart';
import 'package:edu_track/widgets/widgets.dart';

const _schoolAccount = Account(
  id: 15,
  name: "Elite Scholars Academy",
  email: "esa@edu-track.com",
  type: UserType.organization,
);

@RoutePage()
class HomeworkAddScreen extends StatelessWidget {
  const HomeworkAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AccountAppBar(
        account: _schoolAccount,
        actions: [
          AppIconButton(
            icon: AppIcons.notification,
            onPressed: () {
              //TODO: implement.
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppSingleChildScrollView(
          child: AppColumn(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.filter_list),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Homework\'s Name', style: TextStyle(fontSize: 16)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter homework name',
                  errorText: 'This field is important.',
                  suffixIcon: Icon(Icons.error_outline, color: Colors.red),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Subject\' Name', style: TextStyle(fontSize: 16)),
              DropdownButtonFormField<String>(
                items: [
                  DropdownMenuItem(child: Text('Math'), value: 'Math'),
                  DropdownMenuItem(child: Text('Science'), value: 'Science'),
                  DropdownMenuItem(child: Text('History'), value: 'History'),
                ],
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: 'Select Subject Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Organization', style: TextStyle(fontSize: 16)),
              DropdownButtonFormField<String>(
                items: [
                  DropdownMenuItem(
                      child: Text('Organization 1'), value: 'Organization 1'),
                  DropdownMenuItem(
                      child: Text('Organization 2'), value: 'Organization 2'),
                  DropdownMenuItem(
                      child: Text('Organization 3'), value: 'Organization 3'),
                ],
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: 'Select Organization Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Division', style: TextStyle(fontSize: 16)),
              DropdownButtonFormField<String>(
                items: [
                  DropdownMenuItem(
                      child: Text('Division 1'), value: 'Division 1'),
                  DropdownMenuItem(
                      child: Text('Division 2'), value: 'Division 2'),
                  DropdownMenuItem(
                      child: Text('Division 3'), value: 'Division 3'),
                ],
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: 'Select Division',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Description', style: TextStyle(fontSize: 16)),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter a description...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                maxLines: 4,
              ),
              SizedBox(height: 16),
              Text('Upload Homework', style: TextStyle(fontSize: 16)),
              GestureDetector(
                onTap: () {
                  // دعيلي رفع البنيان
                },
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.cloud_upload, size: 48, color: Colors.grey),
                      SizedBox(height: 8),
                      Text(
                        'Click to upload or drag and drop',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'PDF, DOC, ZIP or .RAR (max. 120 MB)',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // الله يجوزك لا تنكت الكود كتير وتحرق وقت
                },
                child: Text('Add a New Homework'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

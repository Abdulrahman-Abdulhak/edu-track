import 'package:auto_route/auto_route.dart';
import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/screens/chat_screen/profile_image.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:edu_track/core/core.dart';

@RoutePage()
class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var badge = AppBadge();
    var badgeStyle = Typographies.textXs;
    var badgeTextHeight = badgeStyle.fontSize! * badgeStyle.lineHeight!;
    var badgeHeight = badge.padding.vertical + badgeTextHeight;
    
    return AppScaffold(
      appBar: MeassageAppBar(),
      body: AppPadding(
        padding: AppEdgeInsets.symmetric(vertical: 1.rem, horizontal: 1.rem),
        child: AppColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          gap: 1.5.rem,
          children: [
            SearchField(
              onSubmit: (String str) {},
            ),
            TextMd.semiBold('Active Now'),
            ProfileImage(),
            TextMd.semiBold('Recent Message'),
            AppListTile(
              leading: ProfileImage(),
              title: AppRow(children: [
                AppBadge(
                  child: TextXs.medium(
                    'LQP Organization',
                    color: AppColors.brand700,
                  ),
                )
              ]),
            ),
            Expanded(
              child: ListView(
                children: [
                  MessageTile(
                      '', 'Olivia Rhye', 'LQP Organization', 'Student', '2'),
                  MessageTile(
                      '', 'Group 11 - Programing', 'LQP Organization', '', ''),
                  MessageTile(
                      '', 'Johnny Johan', 'LQP Organization', 'Student', ''),
                  MessageTile(
                      '', 'Phoenix B.', 'LQP Organization', 'Teacher', ''),
                  MessageTile(
                      '', 'Andi Lane', 'NOP Organization', 'Manager', ''),
                  MessageTile(
                      '', 'Natalia Postman', 'NOP Organization', 'Parent', ''),
                  MessageTile(
                      '.png', 'Malia B.', 'NOP Organization', 'Student', ''),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: AppIcon(icon: AppIcons.home),
          ),
          BottomNavigationBarItem(
            icon: AppIcon(icon: AppIcons.chat),
          
          ),
          BottomNavigationBarItem(
            icon: AppIcon(icon: AppIcons.calendar),
          ),
          BottomNavigationBarItem(
            icon: ,
          ),
        ],
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String imagePath;
  final String name;
  final String organization;
  final String role;
  final String notificationCount;

  MessageTile(this.imagePath, this.name, this.organization, this.role,
      this.notificationCount);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(name),
      subtitle: Row(
        children: [
          Text('$organization ', style: TextStyle(color: Colors.purple)),
          if (role.isNotEmpty)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(role, style: TextStyle(color: Colors.blue)),
            ),
        ],
      ),
      trailing: notificationCount.isNotEmpty
          ? CircleAvatar(
              radius: 10,
              backgroundColor: Colors.purple,
              child: Text(notificationCount,
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            )
          : null,
    );
  }
}

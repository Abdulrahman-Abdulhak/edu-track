import 'package:edu_track/constants/ui/colors.dart';
import 'package:edu_track/widgets/text/text_field.dart';
import 'package:edu_track/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../widgets/icons/logo.dart';

class SidebarNavigationScreen extends StatelessWidget {
  SidebarNavigationScreen({super.key});

  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Logo(size: 32, alignment: Alignment.center),
            SizedBox(width: 8),
            TextDisplayXs.medium("EduTrack"),
          ],
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: searchcontroller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                size: 20,
                color: AppColors.gray500,
              ),
              hintText: "Search",
              hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.gray500,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.gray300),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}

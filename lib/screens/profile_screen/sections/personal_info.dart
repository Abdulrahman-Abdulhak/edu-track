import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/core/core.dart';
import 'package:edu_track/widgets/texts/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/widgets.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var value = 1;
    return AppColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextSm.semiBold('Personal info'),
        TextSm.regular('Update your photo and personal details.'),
        AppContainer(
          padding: AppEdgeInsets.symmetric(
            vertical: 1.25.rem,
            horizontal: 1.rem,
          ),
          decoration: AppBoxDecoration(
            borderRadius: AppBorderRadius.circular(.5.rem),
            color: AppColors.white,
          ),
          child: AppColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: 1.5.rem,
            children: [
              const ProfileTextField(
                label: 'First name',
              ),
              const ProfileTextField(
                label: 'Last name',
              ),
              const ProfileTextFieldIcon(
                label: 'Email',
                appIcons: AppIcons.mail,
              ),
              const ProfileTextFieldIcon(
                label: 'Phone',
                appIcons: AppIcons.phone,
              ),
              TextSm.medium('Contents'),
              const Contents(),
              TextSm.medium('Sex'),
              AppRow(
                gap: .75.rem,
                children: [
                  RadioSex(
                    value: 1,
                    groupValue: value,
                    sex: 'Male',
                    onChanged: (value) {},
                  ),
                  RadioSex(
                    value: 2,
                    groupValue: value,
                    sex: 'Female',
                    onChanged: (value) {},
                  ),
                  RadioSex(
                    value: 3,
                    groupValue: value,
                    sex: 'Other',
                    onChanged: (value) {},
                  ),
                ],
              ),
              TextSm.medium('Birthday'),
            ],
          ),
        ),
      ],
    );
  }
}

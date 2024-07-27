import "package:edu_track/_main/widget/app_stateless_widget.dart";
import "package:edu_track/constants/ui/colors.dart";
import "package:edu_track/utils/extensions/extensions.dart";
import "package:edu_track/widgets/icons/app_icon.dart";
import "package:edu_track/widgets/text/texts/text/sm.dart";
import "package:flutter/material.dart";

class ListTitlSection extends AppStatelessWidget {
  const ListTitlSection({super.key});

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    return ListTile(
      leading: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.blue700,
        ),
        width: 40,
        height: 40,
        child: Text("RK"),
      ),
      title: TextSm.semiBold("Sara N"),
      subtitle: TextSm.regular("aaaa@ggg.com"),
      trailing: AppIcon(
        icon: AppIcons.logOut,
        size: 1.25.rem,
        color: AppColors.gray500,
      ),
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return true;
  }
}

import "package:edu_track/_main/for_widgets/decoration/box_decoration.dart";
import "package:edu_track/_main/for_widgets/paint/paint.dart";
import "package:edu_track/_main/widget/app_stateless_widget.dart";
import "package:edu_track/constants/ui/colors.dart";
import "package:edu_track/utils/extensions/extensions.dart";
import "package:edu_track/widgets/icons/app_icon.dart";
import "package:edu_track/widgets/layout/wrappers/container.dart";
import "package:edu_track/widgets/text/texts/text/md.dart";
import "package:edu_track/widgets/text/texts/text/sm.dart";
import "package:flutter/material.dart";

class ListTileSection extends AppStatelessWidget {
  const ListTileSection({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
  });
  final String firstName;
  final String lastName;
  final String email;

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    var imageNull = [firstName, lastName].combineFirstLetters();
    return ListTile(
      leading: AppContainer(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        decoration: const AppBoxDecoration(
            shape: BoxShape.circle, color: AppColors.brand50),
        width: 2.5.rem,
        height: 2.5.rem,
        child: TextMd.regular(
          imageNull,
          style: AppTextStyle(
            color: AppColors.brand600,
            fontSize: 1.rem,
          ),
        ),
      ),
      title: TextSm.semiBold("$firstName $lastName"),
      subtitle: TextSm.regular(email),
      trailing: GestureDetector(
        onTap: () {},
        child: AppIcon(
          icon: AppIcons.logOut,
          size: 1.25.rem,
          color: AppColors.gray500,
        ),
      ),
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return true;
  }
}

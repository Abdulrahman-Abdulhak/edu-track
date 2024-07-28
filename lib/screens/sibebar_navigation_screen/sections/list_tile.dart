import "package:edu_track/_main/for_widgets/decoration/box_decoration.dart";
import "package:edu_track/_main/widget/app_stateless_widget.dart";
import "package:edu_track/constants/ui/colors.dart";
import "package:edu_track/utils/extensions/extensions.dart";
import "package:edu_track/widgets/icons/app_icon.dart";
import "package:edu_track/widgets/layout/layout.dart";
import "package:edu_track/widgets/text/texts/text/sm.dart";
import "package:flutter/material.dart";

class ListTileSection extends AppStatelessWidget {
  ListTileSection({super.key});
  final String firstName = "Sara";
  final String lastName = "N";
  final String email = "aaaa@ggg.com";

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    return ListTile(
      leading: AppContainer(
        clipBehavior: Clip.antiAlias,
        decoration: const AppBoxDecoration(shape: BoxShape.circle),
        width: 2.5.rem,
        height: 2.5.rem,
        child: Text(""),
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

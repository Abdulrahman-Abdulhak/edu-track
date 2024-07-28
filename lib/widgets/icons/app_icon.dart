import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:edu_track/_main/main.dart';
import 'package:edu_track/utils/sizes/unit_size.dart';

const _base = 'assets/icons/svg';

enum AppIcons {
  alertCircle('alert-circle'),
  arrowDown('arrow-down'),
  arrowLeft('arrow-left'),
  arrowRight('arrow-right'),
  arrowUp('arrow-up'),
  attachHorizontal('attach_horizontal'),
  attachTilted('attach_tilted'),
  barChartVertical('bar-chart_vertical'),
  bold('bold'),
  bookOpen('book-open'),
  book('book'),
  bookmark('bookmark'),
  brain('brain'),
  calendar('calendar'),
  certificate('certificate'),
  chat('chat'),
  checkCircle('checkCircle'),
  check('check'),
  chemistry('chemistry'),
  chevronDown('chevronDown'),
  chevronLeft('chevronLeft'),
  chevronRight('chevronRight'),
  chevronUp('chevronUp'),
  clockOutline('clock_outline'),
  clockRound('clock_round'),
  computerChip('computerChip'),
  cupStarOutline('cup-star_outline'),
  divide('divide'),
  documentLinear('documentLinear'),
  dot('dot'),
  download('download'),
  fileText('fileText'),
  file('file'),
  filtersLines('filtersLines'),
  home('home'),
  image('image'),
  italic('italic'),
  languageFrench('languageFrench'),
  lifeBuoy('lifeBuoy'),
  listBullet('list-bullet'),
  listNumbered('list-numbered'),
  logOut('logOut'),
  mail('mail'),
  mathXY('mathXY'),
  menuSolid('menu_solid'),
  microphone('microphone'),
  minus('minus'),
  moreVertical('more_vertical'),
  notification('notification'),
  pause('pause'),
  phone('phone'),
  play('play'),
  plus('plus'),
  profile('profile'),
  search('search'),
  settings('settings'),
  smile('smile'),
  star('star'),
  successCheckOutline('success-check_outline'),
  uploadCloud('uploadCloud'),
  userPLus('userPLus'),
  userX('userX'),
  x('x'),
  xmlBrackets('xmlBrackets'),
  ;

  final String path;
  const AppIcons(String fileName, [String suffix = 'svg'])
      : path = '$_base/$fileName.$suffix';
}

//* this widget is like the Icon widget but for the applications own icons
class AppIcon extends AppStatelessWidget {
  final UnitSize? size;

  final BoxFit fit;
  final Color color;

  final AppIcons icon;
  
  const AppIcon({
    super.key,
    this.size,
    this.color = Colors.black,
    this.fit = BoxFit.contain,
    required this.icon,
  });

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    final sizeToUse = size?.compute(context, constraints);

    return SizedBox(
      width: sizeToUse,
      height: sizeToUse,
      child: SvgPicture.asset(
        icon.path,
        fit: fit,
        width: sizeToUse,
        height: sizeToUse,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        placeholderBuilder: (context) => Placeholder(color: color),
      ),
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return size != null && size!.needsConstraints;
  }
}

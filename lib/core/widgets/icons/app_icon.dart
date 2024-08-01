import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../_main/main.dart';
import '../../utils/utils.dart';

const _base = 'assets/icons/svg';

//TODO: replace with your own custom made icons.
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
  checkCircle('check-circle'),
  check('check'),
  chemistry('chemistry'),
  chevronDown('chevron-down'),
  chevronLeft('chevron-left'),
  chevronRight('chevron-right'),
  chevronUp('chevron-up'),
  clockOutline('clock_outline'),
  clockRound('clock_round'),
  computerChip('computer-chip'),
  cupStarOutline('cup-star_outline'),
  divide('divide'),
  documentLinear('document-linear'),
  dot('dot'),
  download('download'),
  fileText('file-text'),
  file('file'),
  filtersLines('filters-lines'),
  home('home'),
  image('image'),
  italic('italic'),
  languageFrench('language-french'),
  lifeBuoy('life-buoy'),
  listBullet('list-bullet'),
  listNumbered('list-numbered'),
  logOut('log-out'),
  mail('mail'),
  mathXY('math-xy'),
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
  uploadCloud('upload-cloud'),
  userPLus('user-p-lus'),
  userX('user-x'),
  x('x'),
  xmlBrackets('xml-brackets'),
  ;

  final String path;
  const AppIcons(String fileName, [String suffix = 'svg'])
      : path = '$_base/$fileName.$suffix';
}

//* this widget is like the Icon widget but for the applications own icons
class AppIcon extends AppStatelessWidget {
  final UnitSize? size;

  final BoxFit fit;
  final Color? color;

  final AppIcons icon;

  const AppIcon({
    super.key,
    this.size,
    this.color,
    this.fit = BoxFit.contain,
    required this.icon,
  });

  @override
  Widget awareBuild(BuildContext context, BoxConstraints? constraints) {
    final sizeToUse = size?.compute(context, constraints);
    final colorToUse = color ?? Colors.black;

    return SizedBox(
      width: sizeToUse,
      height: sizeToUse,
      child: SvgPicture.asset(
        icon.path,
        fit: fit,
        width: sizeToUse,
        height: sizeToUse,
        colorFilter: ColorFilter.mode(colorToUse, BlendMode.srcIn),
        placeholderBuilder: (context) => Placeholder(color: colorToUse),
      ),
    );
  }

  @override
  bool needsConstraints(BuildContext context) {
    return [size].needsConstraints;
  }
}

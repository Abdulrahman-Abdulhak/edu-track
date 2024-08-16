import 'package:edu_track/constants/constants.dart';
import 'package:edu_track/core/core.dart';
import 'package:flutter/material.dart';


class Cover extends StatelessWidget {
  const Cover({super.key});

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      children: [
        AppStack(
          children: [
            AppContainer(
              height: 10.rem,
              width: 100.vw,
              decoration: const AppBoxDecoration(
                gradient: LinearGradient(
                  transform: GradientRotation(-45),
                  colors: [
                    Color(0xffA6C0FE),
                    Color(0xffFFEAF6),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: -50,
              child: AppPadding(
                padding: AppEdgeInsets.only(
                  left: 1.rem,
                ),
                child: AppContainer(
                  width: 6.rem,
                  height: 6.rem,
                  clipBehavior: Clip.antiAlias,
                  decoration: AppBoxDecoration(
                    shape: BoxShape.circle,
                    shadows: [
                      AppBoxShadow(
                        color: const Color.fromRGBO(16, 24, 40, 0.08),
                        blurRadius: 16.px,
                        spreadRadius: (-4).px,
                        offset: AppOffset(0.px, 12.px),
                      ),
                      AppBoxShadow(
                        color: const Color.fromRGBO(16, 24, 40, 0.03),
                        blurRadius: 6.px,
                        spreadRadius: (-2).px,
                        offset: AppOffset(0.px, 4.px),
                      ),
                    ],
                    border: AppBorder.all(
                      color: AppColors.white,
                      width: const Pixel(4),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

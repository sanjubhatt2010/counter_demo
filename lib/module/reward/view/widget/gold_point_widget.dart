import 'package:counter_app/bloc/bloc_builder.dart';
import 'package:counter_app/helpers/app_color.dart';
import 'package:counter_app/helpers/app_localization.dart';
import 'package:counter_app/module/reward/bloc/slider_bloc.dart';
import 'package:flutter/material.dart';

class GoldPointsWidget extends StatelessWidget {
  const GoldPointsWidget({
    Key? key,
    required this.points,
    required this.maxPoint,
    required this.level,
    required this.onTap,
    required this.sliderBloc,
  }) : super(key: key);
  final int points;
  final int maxPoint;
  final int level;
  final void Function() onTap;
  final SliderBloc sliderBloc;

  @override
  Widget build(BuildContext context) {
    sliderBloc.calculateBarWidth(
      screenWidth: MediaQuery.of(context).size.width,
      pointBarRatio: maxPoint / points,
    );
    return _buildPointsHorizontalView(context);
  }

  Widget _buildPointsHorizontalView(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              spreadRadius: 10,
              color: AppColor.grey.withOpacity(0.2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.currency_yen,
              color: AppColor.black,
              size: 30,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: AppLocalization.gold,
                      style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: ' (' + AppLocalization.level + ' $level' + ')',
                          style: const TextStyle(
                            color: AppColor.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    '$points ' + AppLocalization.pointsToGold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColor.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _getSlider(context)
                ],
              ),
            ),
            const SizedBox(width: 15),
            const Icon(
              Icons.navigate_next,
              color: AppColor.yellowPrimary,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSlider(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: AppColor.lightGrey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        BlocBuilder(
          bloc: sliderBloc,
          builder: () {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              height: 8,
              width: sliderBloc.sliderWidth,
              decoration: BoxDecoration(
                color: AppColor.green,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
        ),
      ],
    );
  }
}

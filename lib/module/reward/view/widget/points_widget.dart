import 'package:counter_app/helpers/app_color.dart';
import 'package:counter_app/helpers/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PointsWidget extends StatelessWidget {
  const PointsWidget({
    Key? key,
    required this.points,
    required this.money,
  }) : super(key: key);
  final int points;
  final int money;

  @override
  Widget build(BuildContext context) {
    return _buildPointsHorizontalView(context);
  }

  Widget _buildPointsHorizontalView(BuildContext context) {
    final formatter = NumberFormat("#,##0", "en_US");

    return Container(
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
        children: [
          const Icon(
            Icons.star_border_rounded,
            color: AppColor.black,
            size: 35,
          ),
          const SizedBox(width: 5),
          const Text(
            AppLocalization.points,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          Column(
            children: [
              Text(
                formatter.format(points).toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                AppLocalization.equals + " \$" + money.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColor.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

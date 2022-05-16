import 'package:counter_app/helpers/app_color.dart';
import 'package:counter_app/helpers/app_localization.dart';
import 'package:counter_app/helpers/app_route.dart';
import 'package:flutter/material.dart';

class RewardHeaderWidget extends StatelessWidget {
  const RewardHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildTopBarView(context);
  }

  Widget _buildTopBarView(BuildContext context) {
    return Container(
      height: 180 + (MediaQuery.of(context).padding.top),
      color: AppColor.yellowPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildFaqTap(),
                const Spacer(),
                _buildCrossButton(context),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              AppLocalization.welcomeTo,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColor.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text(
                  AppLocalization.plusRewards,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                _buildTimeButton(context),
                const SizedBox(width: 10),
                _buildNotificationButton(context)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCrossButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.close),
      ),
    );
  }

  Widget _buildNotificationButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
      onTap: () =>
            Navigator.of(context).pushNamed(AppRoutes.underDevelopment),
        child: const Icon(Icons.notifications),
      ),
    );
  }

  Widget _buildTimeButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () =>
            Navigator.of(context).pushNamed(AppRoutes.underDevelopment),
        child: const Icon(Icons.access_time_outlined),
      ),
    );
  }

  Widget _buildFaqTap() {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColor.yellowSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
              color: AppColor.black,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.question_mark_outlined,
              color: AppColor.grey,
              size: 15,
            ),
          ),
          const SizedBox(width: 5),
          const Text(
            AppLocalization.faq,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}

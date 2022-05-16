import 'package:counter_app/helpers/app_color.dart';
import 'package:flutter/material.dart';

class EarnRedeemWidget extends StatelessWidget {
  const EarnRedeemWidget({
    Key? key,
    required this.icons,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData icons;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return _buildEarnRedeem(context);
  }

  Widget _buildEarnRedeem(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        height: 120,
        padding: const EdgeInsets.all(15),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icons,
                  color: AppColor.black,
                  size: 35,
                ),
                const SizedBox(height: 15),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.navigate_next,
              color: AppColor.yellowPrimary,
              size: 30,
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}

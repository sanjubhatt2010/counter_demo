import 'package:counter_app/helpers/app_color.dart';
import 'package:counter_app/helpers/app_localization.dart';
import 'package:counter_app/helpers/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReferYourFriendWidget extends StatelessWidget {
  const ReferYourFriendWidget({
    Key? key,
    required this.referedCount,
    required this.onTap,
  }) : super(key: key);
  final int referedCount;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return _buildReferView(context);
  }

  Widget _buildReferView(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        padding: const EdgeInsets.only(left: 15, top: 15),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text(
                  AppLocalization.referYourFriend,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.navigate_next,
                  color: AppColor.yellowPrimary,
                  size: 30,
                ),
                SizedBox(width: 15),
              ],
            ),
            const SizedBox(height: 15),
            _buildTextWidget(
              title: AppLocalization.youGet,
              value: AppLocalization.coupon,
            ),
            const SizedBox(height: 10),
            _buildTextWidget(
              title: AppLocalization.theyGet,
              value: AppLocalization.freeShippingCoupon,
            ),
            const SizedBox(height: 15),
            _buildReferCodeView(),
            const SizedBox(height: 20),
            Text(
              AppLocalization.youHaveReferred +
                  ' $referedCount ' +
                  AppLocalization.friends,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColor.black,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 15),
            _buildFacebookTwitterTap(context),
          ],
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildTextWidget({required String title, required String value}) {
    return Row(
      children: [
        const Icon(
          Icons.circle,
          color: AppColor.yellowPrimary,
          size: 10,
        ),
        const SizedBox(width: 5),
        RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: title,
            style: const TextStyle(
              color: AppColor.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: value,
                style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }

  Widget _buildReferCodeView() {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColor.lightGrey,
        ),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                AppLocalization.url,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColor.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => _copy(),
            child: Ink(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.yellowPrimary,
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.file_copy,
                    color: AppColor.black,
                    size: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    AppLocalization.copy,
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFacebookTwitterTap(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          onTap: () =>
              Navigator.of(context).pushNamed(AppRoutes.underDevelopment),
          child: Ink(
            height: 45,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: AppColor.yellowPrimary.withOpacity(0.2),
            ),
            child: const Icon(
              Icons.currency_pound,
              color: AppColor.yellowSecondary,
              size: 30,
            ),
          ),
        ),
        const SizedBox(width: 15),
        InkWell(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(20),
          ),
          onTap: () =>
              Navigator.of(context).pushNamed(AppRoutes.underDevelopment),
          child: Ink(
            height: 45,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(20),
              ),
              color: AppColor.yellowPrimary.withOpacity(0.2),
            ),
            child: const Icon(
              Icons.cruelty_free,
              color: AppColor.yellowSecondary,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }

  _copy() {
    Clipboard.setData(
      const ClipboardData(text: AppLocalization.url),
    );
  }
}

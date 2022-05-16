import 'package:counter_app/helpers/app_color.dart';
import 'package:counter_app/helpers/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReferralScreen extends StatelessWidget {
  const ReferralScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        title: const Text(
          AppLocalization.referral,
          style: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppLocalization.weValueFriendship,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColor.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              AppLocalization.followTheStepsBelowAndGetRewarded,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColor.grey,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            _buildReferStepView(),
            _buildGiftInfoView(),
            const SizedBox(height: 20),
            _buildReferCodeView(),
          ],
        ),
      ),
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

  Widget _buildGiftInfoView() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColor.lightGrey,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          _buildGiftView(
            icon: Icons.castle,
            title: AppLocalization.youGet,
            info: AppLocalization.scorePointsEgp,
          ),
          const SizedBox(height: 20),
          _buildGiftView(
            icon: Icons.wallet_giftcard,
            title: AppLocalization.theyGet,
            info: AppLocalization.discountCoupon,
          ),
          const SizedBox(height: 20),
          _buildGiftInfoVBottomView(),
        ],
      ),
    );
  }

  _buildGiftView({
    required IconData icon,
    required String title,
    required String info,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: AppColor.black,
            size: 20,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColor.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  info,
                  style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildGiftInfoVBottomView() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.lightGrey,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        border: Border.all(
          color: AppColor.lightGrey,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          const Text(
            AppLocalization.referFriendsAndGetExtraRewards,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.local_shipping,
                color: AppColor.black,
                size: 20,
              ),
              SizedBox(width: 5),
              Text(
                AppLocalization.freeShipping,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildReferStepView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildStepCount('1'),
            const SizedBox(width: 10),
            _buildStepText(AppLocalization.shareYourLink),
            const SizedBox(width: 10),
            const Icon(
              Icons.file_copy,
              color: AppColor.black,
              size: 15,
            ),
          ],
        ),
        _buildLine(25),
        Row(
          children: [
            _buildStepCount('2'),
            const SizedBox(width: 10),
            _buildStepText(AppLocalization.yourFriendSignupUsingYourLink),
          ],
        ),
        _buildLine(25),
        Row(
          children: [
            _buildStepCount('3'),
            const SizedBox(width: 10),
            _buildStepText(AppLocalization.yourFriendPlacesAnOrder),
          ],
        ),
        _buildLine(35),
      ],
    );
  }

  Widget _buildLine(double height) {
    return Container(
      height: height,
      width: 2,
      color: AppColor.lightGrey,
      margin: const EdgeInsets.only(left: 25),
    );
  }

  Widget _buildStepCount(String count) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColor.lightGrey,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          count,
          style: const TextStyle(
            color: AppColor.black,
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  Widget _buildStepText(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColor.black,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  _copy() {
    Clipboard.setData(
      const ClipboardData(text: AppLocalization.url),
    );
  }
}

import 'package:counter_app/bloc/bloc_builder.dart';
import 'package:counter_app/helpers/app_color.dart';
import 'package:counter_app/helpers/app_localization.dart';
import 'package:counter_app/helpers/app_route.dart';
import 'package:counter_app/module/reward/bloc/reward_bloc.dart';
import 'package:counter_app/module/reward/bloc/slider_bloc.dart';
import 'package:flutter/material.dart';
import 'widget/earn_redeem_widget.dart';
import 'widget/gold_point_widget.dart';
import 'widget/points_widget.dart';
import 'widget/refer_your_friend_widget.dart';
import 'widget/reward_header_widget.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({Key? key}) : super(key: key);

  @override
  _RewardScreenState createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  final SliderBloc _sliderBloc = SliderBloc();
  final RewardBloc _rewardBloc = RewardBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: BlocBuilder(
        bloc: _rewardBloc,
        builder: () {
          return SingleChildScrollView(
            child: Stack(
              children: [
                const RewardHeaderWidget(),
                _buildBotomBarView(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBotomBarView() {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 140),
            PointsWidget(
              points: _rewardBloc.state.rewardModel.points,
              money: _rewardBloc.state.rewardModel.money,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: EarnRedeemWidget(
                    icons: Icons.castle,
                    title: AppLocalization.earn,
                    onTap: () => Navigator.of(context)
                        .pushNamed(AppRoutes.underDevelopment),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: EarnRedeemWidget(
                    icons: Icons.wallet_giftcard,
                    title: AppLocalization.redeem,
                    onTap: () => Navigator.of(context)
                        .pushNamed(AppRoutes.underDevelopment),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GoldPointsWidget(
              level: _rewardBloc.state.rewardModel.level,
              maxPoint: _rewardBloc.state.rewardModel.levelMaxPoints,
              points: _rewardBloc.state.rewardModel.levelPoints,
              sliderBloc: _sliderBloc,
              onTap: () =>
                  Navigator.of(context).pushNamed(AppRoutes.underDevelopment),
            ),
            const SizedBox(height: 20),
            ReferYourFriendWidget(
              referedCount: _rewardBloc.state.rewardModel.referedCount,
              onTap: () =>
                  Navigator.of(context).pushNamed(AppRoutes.referralScreen),
            ),
          ],
        ),
      ),
    );
  }
}

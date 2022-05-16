import 'package:counter_app/bloc/bloc.dart';
import 'package:counter_app/models/state_model.dart';
import 'package:counter_app/module/reward/view_model/reward_view_model.dart';

class RewardBloc extends Bloc<RewardViewModel> {
  @override
  RewardViewModel initDefaultValue() {
    return RewardViewModel(
      dataState: DataState.initial,
      rewardModel: RewardModel(
        level: 3,
        levelMaxPoints: 5000,
        levelPoints: 1090,
        money: 250,
        points: 2000,
        referedCount: 0,
      ),
    );
  }
}

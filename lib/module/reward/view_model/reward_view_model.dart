import 'package:counter_app/models/state_model.dart';

class RewardViewModel {
  DataState dataState;
  RewardModel rewardModel;

  RewardViewModel({
    required this.dataState,
    required this.rewardModel,
  });
}

class RewardModel {
  final int points;
  final int money;
  final int level;
  final int levelMaxPoints;
  final int levelPoints;
  final int referedCount;

  RewardModel({
    required this.points,
    required this.money,
    required this.level,
    required this.levelMaxPoints,
    required this.levelPoints,
    required this.referedCount,
  });
}

import 'package:counter_app/bloc/bloc.dart';
import 'package:counter_app/module/reward/view_model/slider_view_model.dart';

class SliderBloc extends Bloc<SliderViewModel> {
  @override
  SliderViewModel initDefaultValue() {
    return SliderViewModel(
      width: 0,
    );
  }

  double get sliderWidth => state.width;

  calculateBarWidth(
      {required double screenWidth, required double pointBarRatio}) {
    double otherWidgetWidth = 170;
    double sliderWidth = screenWidth - otherWidgetWidth;
    double pointBarWidth = sliderWidth / pointBarRatio;
    Future.delayed(const Duration(seconds: 1), () {
      state.width = pointBarWidth;
      emit(state);
    });
    emit(state);
  }
}

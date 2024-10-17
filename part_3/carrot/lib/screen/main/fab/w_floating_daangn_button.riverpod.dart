import 'package:fast_app_base/screen/main/fab/w_floating_daangn_button.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final floatingButtonStateProvider =
    StateNotifierProvider<FloatingButtonStateNotifier, FloatingButtonState>(
        (ref) => FloatingButtonStateNotifier(FloatingButtonState(false, false)));

class FloatingButtonStateNotifier extends StateNotifier<FloatingButtonState> {
  FloatingButtonStateNotifier(super.state);


  @override
  bool updateShouldNotify(FloatingButtonState old, FloatingButtonState current) {
    return super.updateShouldNotify(old, current);
  }

  void onTapButton() {
    state = FloatingButtonState(!state.isExpanded, true);
  }

  void changeButtonSize(bool isSmall) {
    state = FloatingButtonState(state.isExpanded, isSmall);
  }
}

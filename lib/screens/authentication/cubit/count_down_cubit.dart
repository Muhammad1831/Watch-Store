import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/screens/authentication/cubit/count_down_state.dart';

class CountDownCubit extends Cubit<CountDownState> {
  CountDownCubit() : super(CountDownInitial());

  late Timer timer;

  countDownStart({required int totalSecond}) {
    emit(CountDownDecrease(remainSeconds: totalSecond));

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (totalSecond == 0) {
        countDownCancel();
        emit(CountDownEnded());
      } else {
        --totalSecond;
        emit(CountDownDecrease(remainSeconds: totalSecond));
      }
    });
  }

  countDownCancel() {
    timer.cancel();
  }
}

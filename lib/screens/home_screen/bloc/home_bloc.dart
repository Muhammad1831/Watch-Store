import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store/models/home_model.dart';
import 'package:watch_store/data/repository/home_repository.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  InterFaceHomeRepository homeRepository;

  HomeBloc(this.homeRepository) : super(HomeLoding()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeInitial) {
        emit(HomeLoding());
        final home = await homeRepository.getHome();
        emit(HomeLoaded(home));
      } else {
        emit(HomeError());
      }
    });
  }
}
